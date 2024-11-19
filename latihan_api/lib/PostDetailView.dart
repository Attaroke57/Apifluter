// views/post_detail_view.dart

import 'package:flutter/material.dart';

class PostDetailView extends StatelessWidget {
  final String imageTeam;
  final String teamName;
  final String league;
  final String description;

  const PostDetailView({
    required this.imageTeam,
    required this.teamName,
    required this.league,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(
              child: Image.network(
                imageTeam,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            
            Text(
              'League: $league',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
