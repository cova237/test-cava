
class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] is String)
          ? double.tryParse(json['price']) ??
              0.0 // Si 'price' est un String, essayez de le convertir en double.
          : (json['price'] is double)
              ? json[
                  'price'] // Si 'price' est déjà un double, on le laisse tel quel.
              : 0.0, // Valeur par défaut si 'price' est null ou un type non pris en charge.
    );
  }

  // Méthode pour convertir un objet Product en un format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}

class User {
  final String username;
  final String email;
  final String password;

  User({
    required this.username,
    required this.email,
    required this.password,
  });

  // Méthode pour convertir un objet User en un objet JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Méthode pour convertir un objet User en un format JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }
}

class Subscription {
  final int id;
  final int userId;
  final Product product;
  final String startDate;
  final String endDate;
  final double totalAmount;

  Subscription({
    required this.id,
    required this.userId,
    required this.product,
    required this.startDate,
    required this.endDate,
    required this.totalAmount,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      userId: json['user'],
      product: Product.fromJson(json['product']),
      startDate: json['start_date'],
      endDate: json['end_date'],
      totalAmount: (json['total_amount'] is String)
          ? double.tryParse(json['total_amount']) ?? 0.0
          : (json['total_amount'] is double)
              ? json['total_amount']
              : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'product': product.toJson(),
      'start_date': startDate,
      'end_date': endDate,
      'total_amount': totalAmount,
    };
  }
}
