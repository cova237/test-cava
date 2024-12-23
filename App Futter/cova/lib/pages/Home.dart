import 'package:cova/Riverpod_data.dart';
import 'package:cova/pages/detaiProduit.dart';
import 'package:cova/pages/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(
        productProvider); // Utilisation du provider pour récupérer les produits
    final transactions = ref.watch(
        subscriptionProvider); // Utilisation du provider pour récupérer les transactions

    return Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.orange,
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Nos produits',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Section des produits avec défilement horizontal
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(bottom: 4, left: 20),
              height: 200, // Ajustez la hauteur selon vos besoins
              child: products.when(
                data: (productList) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(productList.length, (index) {
                        final product = productList[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigation vers la page de détail du produit
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductPage(product: product, userId: 1),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 150, // Largeur de chaque produit
                            decoration: BoxDecoration(
                              color: Colors.grey[100], // Couleur de fond
                              borderRadius:
                                  BorderRadius.circular(15), // Coins arrondis
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
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
                      }),
                    ),
                  );
                },
                loading: () => const Center(
                    child:
                        CircularProgressIndicator()), // Affichage pendant le chargement
                error: (error, stackTrace) => Center(
                    child:
                        Text('Erreur : $error')), // Affichage en cas d'erreur
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),

          // Section des transactions récentes
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Transactions récentes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Liste des transactions via Riverpod
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: transactions.when(
                data: (transactionsList) => ListView.separated(
                  itemCount: transactionsList.length,
                  separatorBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final transaction = transactionsList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        title: Text(
                          transaction.product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          transaction.startDate,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
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
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Affiche la bottom sheet
                          transactionDetails(context, transaction);
                        },
                      ),
                    );
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Erreur : $error')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
