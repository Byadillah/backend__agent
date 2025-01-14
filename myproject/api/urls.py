from django.urls import path 
from . import views






urlpatterns = [
        path('user/',views.get_user,name='get_user'),
        path('user/create/',views.create_user,name='create_user'),
        path('user/agent/', views.chat_agent, name='chat_agent'),
        path('user/translate/', views.translate, name='translate'),

        ]
