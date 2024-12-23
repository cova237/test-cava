import 'package:cova/pages/Home.dart';
import 'package:cova/pages/Produits.dart';
import 'package:cova/pages/Transaction.dart';
import 'package:cova/pages/util.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  int _currentindex = 0;
  List<String> titres = ["COVA", "Nos produits", "Vos transactions"];
  void _setcurrentindex(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'voir nos prduits',
                onPressed: () {
                  setState(() {
                    _currentindex = 1;
                  });
                },
              ),
            ),
          ],
          title: Text(
            titres[_currentindex],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[700],
          titleTextStyle: const TextStyle(color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: drawers(context),
        body: [
          Home(),
          Produits(),
          Transaction(),
        ][_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _setcurrentindex(index),
          currentIndex: _currentindex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange[700],
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Produits',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Transactions',
            ),
          ],
        ));
  }
}
