
from rest_framework.viewsets import ModelViewSet
from .models import Product, Subscription, User
from .serialisers import ProductSerializer, SubscriptionSerializer
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serialisers import UserSerializer

class ProductViewSet(ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

class SubscriptionViewSet(ModelViewSet):
    queryset = Subscription.objects.all()
    serializer_class = SubscriptionSerializer


class RegisterView(APIView):
    def post(self, request):
        username = request.data.get('username')
        email = request.data.get('email')
        password = request.data.get('password')

        # Vérification des champs
        if username and email and password:
            user = User.objects.create_user(username=username, email=email, password=password)
            # Utilisation du serializer pour la réponse
            serializer = UserSerializer(user)
            return Response({"message": "Utilisateur créé avec succès", "user": serializer.data}, status=status.HTTP_201_CREATED)
        
        return Response({"error": "Tous les champs doivent être remplis"}, status=status.HTTP_400_BAD_REQUEST)

class LoginView(APIView):
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')

        # Authentification de l'utilisateur
        user = authenticate(request, username=username, password=password)
        if user:
            return Response({"message": "Connexion réussie"}, status=status.HTTP_200_OK)
        
        return Response({"error": "Identifiants invalides"}, status=status.HTTP_401_UNAUTHORIZED)