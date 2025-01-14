from django.db import models



class Student(models.Model):
    firstname = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)


class Agent(models.Model):
    role = models.CharField(max_length=255)
    content = models.TextField()


class KeepMessage(models.Model):
    question = models.TextField()
    answer = models.TextField()


class Translate(models.Model):
    french = models.TextField()
    comorian = models.TextField()



# Create your models here.
