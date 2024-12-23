import 'package:cova/pages/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cova/Riverpod_data.dart'; // Importer votre fichier de provider

class Transaction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Utilisation du provider pour récupérer les messages (ou données similaires)
    final transactions = ref.watch(subscriptionProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: transactions.when(
        data: (transactionsList) {
          return ListView.separated(
            itemCount: transactionsList.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey.shade300, // Couleur du trait
              thickness: 1, // Épaisseur du trait
              indent: 16, // Marge à gauche
              endIndent: 16, // Marge à droite
            ),
            itemBuilder: (context, index) {
              final transaction = transactionsList[
                  index]; // Accéder aux données de chaque transaction
              return ListTile(
                title: Text(
                  transaction.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(transaction.startDate,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction.totalAmount.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      transaction.endDate,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                onTap: () {
                  transactionDetails(context, transaction);
                },
              );
            },
          );
        },
        loading: () => const Center(
            child:
                CircularProgressIndicator()), // Affichage pendant le chargement
        error: (error, stackTrace) =>
            Center(child: Text('Erreur : $error')), // Affichage en cas d'erreur
      ),
    );
  }
}
