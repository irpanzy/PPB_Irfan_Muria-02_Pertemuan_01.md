import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = false.obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var fetchedPosts = await apiService.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch posts');
    } finally {
      isLoading(false);
    }
  }

  void addPost(Post post) async {
    try {
      var newPost = await apiService.createPost(post);
      posts.add(newPost);
      Get.snackbar('Success', 'Post created successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create post');
    }
  }

  void updatePost(int id, Post post) async {
    try {
      var updatedPost = await apiService.updatePost(id, post);
      int index = posts.indexWhere((p) => p.id == id);
      if (index != -1) {
        posts[index] = updatedPost;
        Get.snackbar('Success', 'Post updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update post');
    }
  }

  void deletePost(int id) async {
    try {
      await apiService.deletePost(id);
      posts.removeWhere((post) => post.id == id);
      Get.snackbar('Success', 'Post deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete post');
    }
  }
}
