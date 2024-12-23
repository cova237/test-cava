

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

// URL de l'API Django
const String baseUrl = 'http://127.0.0.1:8000/api';

class AuthState {
  final bool isLoading;
  final String message;

  AuthState({this.isLoading = false, this.message = ''});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  // Fonction pour gérer l'inscription
  Future<void> registerUser(
      String username, String email, String password) async {
    state = AuthState(isLoading: true); // Mettre l'état en "loading"

    final url = '$baseUrl/register/'; // URL de l'API Django
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        state = AuthState(
            isLoading: false, message: "Utilisateur créé avec succès !");
      } else {
        state = AuthState(
            isLoading: false, message: "Erreur lors de l'inscription.");
      }
    } catch (e) {
      state = AuthState(
          isLoading: false, message: "Erreur de connexion au serveur.");
    }
  }

  // Fonction pour gérer la connexion
  Future<void> loginUser(String username, String password) async {
    state = AuthState(isLoading: true); // Mettre l'état en "loading"

    final url = '$baseUrl/login/'; // URL de l'API Django
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        state = AuthState(isLoading: false, message: "Connexion réussie !");
      } else {
        state = AuthState(isLoading: false, message: "Erreur de connexion.");
      }
    } catch (e) {
      state = AuthState(
          isLoading: false, message: "Erreur de connexion au serveur.");
    }
  }
}

// Provider d'authentification
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Provider pour obtenir les produits
final productProvider = FutureProvider<List<Product>>((ref) async {
  final response = await http.get(Uri.parse('$baseUrl/products/'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));

    return jsonResponse.map((data) => Product.fromJson(data)).toList();
  } else {
    throw Exception('Échec de chargement des produits');
  }
});

// Provider pour obtenir les souscriptions
final subscriptionProvider = FutureProvider<List<Subscription>>((ref) async {
  //final response = await http.get(Uri.parse('$baseUrl/subscriptions'));
  final response = await http.get(Uri.parse('$baseUrl/subscriptions/'));

  if (response.statusCode == 200) {
    //List jsonResponse = json.decode(response.body);
    final List<dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));
    return jsonResponse.map((data) => Subscription.fromJson(data)).toList();
  } else {
    throw Exception('Échec de chargement des souscriptions');
  }
});

// Provider pour ajouter un produit à la souscription
Future<void> addSubscription(Subscription subscription) async {
  final response = await http.post(
    Uri.parse('$baseUrl/subscriptions/'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(subscription.toJson()),
  );

  if (response.statusCode != 201) {
    throw Exception('Échec de la souscription');
  }
}
