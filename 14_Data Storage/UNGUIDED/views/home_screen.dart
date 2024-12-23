import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../models/post_model.dart';

class HomeScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNGUIDED'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              var post = postController.posts[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          post.body,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showPostDialog(post, isEdit: true);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              postController.deletePost(post.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPostDialog(Post(id: 0, title: '', body: ''), isEdit: false);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _showPostDialog(Post post, {required bool isEdit}) {
    final titleController = TextEditingController(text: post.title);
    final bodyController = TextEditingController(text: post.body);

    Get.defaultDialog(
      title: isEdit ? 'Edit Post' : 'Create Post',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
            maxLines: 3,
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          if (isEdit) {
            postController.updatePost(
              post.id,
              Post(
                id: post.id,
                title: titleController.text,
                body: bodyController.text,
              ),
            );
          } else {
            postController.addPost(
              Post(
                id: DateTime.now().millisecondsSinceEpoch,
                title: titleController.text,
                body: bodyController.text,
              ),
            );
          }
          Get.back();
        },
        child: Text(isEdit ? 'Update' : 'Create'),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }
}
