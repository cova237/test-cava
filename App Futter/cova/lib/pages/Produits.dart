import 'package:cova/Riverpod_data.dart';
import 'package:cova/pages/detaiProduit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Produits extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Utilisation du provider pour récupérer les produits
    final products = ref.watch(productProvider);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: products.when(
          data: (productList) {
            // Obtenir l'orientation de l'écran
            Orientation orientation = MediaQuery.of(context).orientation;

            // Déterminer le nombre de colonnes en fonction de l'orientation
            int crossAxisCount = orientation == Orientation.portrait ? 2 : 3;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    crossAxisCount, // 2 colonnes en portrait, 3 en paysage
                crossAxisSpacing: 10, // Espacement horizontal entre les items
                mainAxisSpacing: 10, // Espacement vertical entre les items
                childAspectRatio:
                    orientation == Orientation.portrait ? 1.19 : 0.75,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(product: product, userId: 1),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        // Image en haut de chaque cellule
                        Image.asset(
                          'assets/cv_sf.png',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          product.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              maxLines: 3, // Limiter à 3 lignes
                              overflow: TextOverflow
                                  .ellipsis, // Ajouter "..." si le texte dépasse
                              softWrap:
                                  true, // Permet de couper le texte si nécessaire
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(
              child:
                  CircularProgressIndicator()), // Affichage pendant le chargement
          error: (error, stackTrace) => Center(
              child: Text('Erreur : $error')), // Affichage en cas d'erreur
        ),
      ),
    );
  }
}
