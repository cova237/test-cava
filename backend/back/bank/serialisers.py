from rest_framework import serializers
from .models import Product, Subscription
from django.contrib.auth.models import User

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'

class SubscriptionSerializer(serializers.ModelSerializer):
    product = ProductSerializer()

    class Meta:
        model = Subscription
        fields = ['id', 'user', 'product', 'start_date', 'end_date', 'total_amount']



class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']
