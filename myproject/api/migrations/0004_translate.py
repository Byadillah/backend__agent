# Generated by Django 5.1.4 on 2025-01-09 18:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_keepmessage'),
    ]

    operations = [
        migrations.CreateModel(
            name='Translate',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('french', models.TextField()),
                ('comorian', models.TextField()),
            ],
        ),
    ]
