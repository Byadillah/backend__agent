from rest_framework import serializers as st
from .models import Student, Agent, KeepMessage,Translate




class StudentSerializer(st.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'


class AgentSerializer(st.ModelSerializer):
    class Meta:
        model = Agent
        fields = '__all__'


class KeepMessageSerializer(st.ModelSerializer):
    class Meta:
        model = KeepMessage
        fields = '__all__'


class TranslateSerializer(st.ModelSerializer):
    class Meta:
        model = Translate
        fields = '__all__'
