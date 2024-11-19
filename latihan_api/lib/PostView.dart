// views/post_view.dart

import 'package:latihan_api/PostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_api/PostDetailView.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indonesian League Soccer'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return Card(
              child: ListTile(
                leading: post.strBadge.isNotEmpty
                    ? Image.network(
                        post.strBadge,
                        width: 70,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image),
                      )
                    : Icon(Icons.image),
                title: Text(post.strTeam),
                subtitle: Text(post.strLeague),
                trailing: Icon(Icons.arrow_forward_ios), 
                onTap: () {
                  Get.to(
                    () => PostDetailView(
                      imageTeam: post.strBadge,
                      teamName: post.strTeam,
                      league: post.strLeague,
                      description: post.strDescriptionEN,
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
