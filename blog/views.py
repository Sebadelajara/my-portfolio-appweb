from django.shortcuts import render,get_object_or_404
from .models import Post
# Create your views here.

# vista que dirije a pagina principal de los post


def render_posts(request):
    posts = Post.objects.all()
    return render(request, 'posts.html', {'posts': posts})


# esta vista dirije a la pagina detellada de cada post
def post_detail(request, post_id):
    post = get_object_or_404(Post, pk=post_id) #si no encuentra el objecto devuelve pagina 404
    return render(request, 'post_details.html', {'post': post})
