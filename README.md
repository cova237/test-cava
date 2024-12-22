# Projet Flutter & Django

Ce projet combine une application Flutter pour le front-end et Django pour le back-end. Voici les instructions pour configurer et exécuter le projet.

---

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

### Pour Flutter :
- Flutter SDK ([Installation](https://docs.flutter.dev/get-started/install))
- Un éditeur de texte comme VS Code ou Android Studio

### Pour Django :
- Python 3.x ([Installation](https://www.python.org/downloads/))
- pip (inclus avec Python 3.x)

---

## Configuration du projet

### 1. Configuration du projet Flutter

1. Clonez le répertoire du projet Flutter 
2. Accédez au répertoire du projet Flutter :
   ```bash
   cd App Flutter
   ```
   ```bash
   cd cova
   ```
3. Récupérez les dépendances du projet avec la commande suivante :
   ```bash
   flutter pub get
   ```
4. Lancez l'application Flutter sur un émulateur ou un appareil connecté :
   ```bash
   flutter run
   ```

### 2. Configuration du projet Django

1. Clonez le répertoire du projet Django 
  
2. Accédez au répertoire du projet Django :
   ```bash
   cd backend
   ```
   ```bash
   cd back
   ```
3. Créez un environnement virtuel Python :
   ```bash
   python -m venv venv
   ```
4. Activez l'environnement virtuel :
   - Sous Windows :
     ```bash
     venv\Scripts\activate
     ```
   - Sous macOS/Linux :
     ```bash
     source venv/bin/activate
     ```

5. Lancez le serveur de développement Django :
   ```bash
   django-admin runserver
   ```

---

## Structure du projet

### Front-end (Flutter)
- Dossier : `cova`
- Commandes principales :
  - Récupération des packages : `flutter pub get`
  - Lancer l'application : `flutter run`

### Back-end (Django)
- Dossier : `back`
- Commandes principales :
  - Appliquer les migrations : `python manage.py migrate`
  - Lancer le serveur : `django-admin runserver`

---

## Auteur
Denilson Duplex Ngoumla

## Licence
Ce projet est sous licence [MIT](LICENSE).

