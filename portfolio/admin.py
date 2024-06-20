from django.contrib import admin
from .models import Project, Skill, Tag


class ProjectAdmin(admin.ModelAdmin):
    filter_horizontal = ('tags',)


admin.site.register(Project, ProjectAdmin)
admin.site.register(Skill)
admin.site.register(Tag)
