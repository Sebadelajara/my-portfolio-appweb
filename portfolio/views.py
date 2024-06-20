from django.shortcuts import render
from .models import Project, Skill
# Create your views here.


def home(request):
    projects = Project.objects.all()
    skills = Skill.objects.all()

    return render(request, 'home.html', {'projects': projects, 'skills': skills})


def about(request):
    return render(request, 'about.html')


def projects(request):
    return render(request, 'projects.html')


def contact(request):
    return render(request, 'contact.html')
