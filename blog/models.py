from django.db import models
import datetime

# Create your models here.


class Post(models.Model):
    title = models.CharField(max_length=50)
    description = models.TextField()
    image = models.ImageField(upload_to='blog/images',
                              height_field=None, width_field=None, max_length=None)
    date = models.DateField(datetime.date.today)
