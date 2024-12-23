import 'package:cova/pages/App.dart';
import 'package:cova/pages/Connexion.dart';
import 'package:cova/pages/Inscription.dart';
import 'package:cova/pages/util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Détecter l'orientation de l'écran
    Orientation orientation = MediaQuery.of(context).orientation;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: orientation == Orientation.landscape
                ? Row(
                    // Utiliser une Row en mode paysage
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      logo(),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            boutton(largeur, "Créer un compte", Colors.teal,
                                () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return RegisterPage();
                                }),
                              );
                            }),
                            boutton(largeur, "J'ai déjà un compte COVA",
                                Colors.orange, () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return Connexion();
                                }),
                              );
                            }),
                            boutton(largeur, "Tester l'application",
                                Colors.orange[800]!, () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return const Acceuil();
                                }),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    // Utiliser une Column en mode portrait
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        logo(),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              boutton(largeur, "Créer un compte", Colors.teal,
                                  () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return RegisterPage();
                                  }),
                                );
                              }),
                              boutton(largeur, "J'ai déjà un compte COVA",
                                  Colors.orange, () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return Connexion();
                                  }),
                                );
                              }),
                              boutton(largeur, "Tester l'application",
                                  Colors.orange[800]!, () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const Acceuil();
                                  }),
                                );
                              }),
                            ],
                          ),
                        ),
                      ])));
  }
}
