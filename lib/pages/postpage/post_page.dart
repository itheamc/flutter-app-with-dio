import 'package:flutter/material.dart';
import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/repositories/posts_repository/post_repository.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
          centerTitle: true,
        ),
        body: FutureBuilder<ApiResponse>(
          future: PostRepository.initialize().posts(),
          builder: (context, response) {
            if (response.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (response.connectionState == ConnectionState.done) {
              final data = response.data;
              if (data == null) return const Center(child: Text("Something went wrong!!"));

              if (data.status == null) return Center(child: Text(data.message ?? "Error with api request!!"));

              if (data.status != 200) return Center(child: Text(data.message ?? "Server problem!!"));

              if (data.data == null) return const Center(child: Text("No data!!"));
              return ListView.builder(
                itemCount: data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data.data[index].title),
                    subtitle: Text(data.data[index].body, maxLines: 1, overflow: TextOverflow.ellipsis),
                    leading: Text(data.data[index].id.toString()),
                  );
                },
              );
            }

            return Center(child: Text(response.error.toString()));
          },
        )
    );
  }
}
