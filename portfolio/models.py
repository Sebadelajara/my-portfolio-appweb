from django.db import models


OPCIONES = [
    (0, '0'),
    (1, '1'),
    (2, '2'),
    (3, '3'),
    (4, '4'),
    (5, '5'),
    (6, '6'),
    (7, '7'),
    (8, '8'),
    (9, '9'),
    (10, '10'),
]

# Create your models here.

# modelo creado para la seccion de proyectos


class Tag(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self) -> str:
        return self.name


class Project(models.Model):
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=250)
    image = models.ImageField(upload_to='portfolio/images/')
    url = models.URLField(blank=True)
    url_github = models.URLField(blank=True)
    tags = models.ManyToManyField(Tag, blank=True)

    def __str__(self) -> str:
        return self.title


class Skill(models.Model):
    title = models.CharField(max_length=50)
    image = models.ImageField(upload_to='portafolio/icon-skill')
    experiencia = models.IntegerField(choices=OPCIONES, default=0)

    def __str__(self) -> str:
        return self.title
