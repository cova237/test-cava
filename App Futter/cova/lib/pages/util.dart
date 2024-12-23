import 'package:flutter/material.dart';

Widget texte(String texte) {
  return Text(
    texte,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );
}

//page cachee
Widget drawers(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.orange[800],
          ),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.orange[800]),
            accountName: const Text(
              "Ngoumla Denilson",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text("denilsonngouma@gmail.com"),
            currentAccountPictureSize: const Size.square(40),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 165, 255, 137),
              child: Text(
                "D",
                style: TextStyle(fontSize: 20.0, color: Colors.green),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('LogOut'),
          onTap: () async {},
        ),
        ListTile(
          leading: const Icon(Icons.close),
          title: const Text('Fermer'),
          onTap: () {
            Navigator.of(context).pop(); // Ferme le Drawer
          },
        ),
      ],
    ),
  );
}

// Fonction pour afficher la BottomSheet avec les détails de la transaction

void transactionDetails(BuildContext context, dynamic transaction) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Détails de la transaction',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Detail('Nom du produit :', transaction.product.name),
              Detail('Date de souscription :', transaction.startDate),
              Detail('Date de début de la couverture :', transaction.startDate),
              Detail('Date de fin de la couverture :', transaction.endDate),
              Detail('Montant total :', transaction.totalAmount.toString()),
              Detail(
                  "Référence à l'utilisateur :", transaction.userId.toString()),
              Detail("Référence au produit souscrit :",
                  transaction.product.id.toString()),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Fermer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget Detail(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

//image hompage
Widget logo() {
  return Expanded(
    flex: 3,
    child: Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        'assets/cv_sf.png',
        fit: BoxFit.contain,
      ),
    ),
  );
}

//bouton hompage
Widget boutton(
    double largeur, String texte, Color color, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: largeur - 40,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        texte,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
