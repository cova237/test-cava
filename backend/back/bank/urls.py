from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ProductViewSet, SubscriptionViewSet, RegisterView, LoginView

router = DefaultRouter()
router.register(r'products', ProductViewSet)
router.register(r'subscriptions', SubscriptionViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
]