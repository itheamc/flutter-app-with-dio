import 'package:flutter/material.dart';
import 'package:flutter_app_with_dio/providers/post_provider.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
          centerTitle: true
        ),
        body: Consumer<PostProvider>(
          builder: (context, provider, child) {
            final response = provider.response;
            if (response == null) return const Center(child: CircularProgressIndicator());

            if (response.status == null) return Center(child: Text(response.message ?? "Error with api request!!"));

            if (response.status != 200) return Center(child: Text(response.message ?? "Server problem!!"));

            if (response.data == null) return const Center(child: Text("No data!!"));
            return RefreshIndicator(
                child: ListView.builder(
                  itemCount: response.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(response.data[index].title),
                      subtitle: Text(response.data[index].body, maxLines: 1, overflow: TextOverflow.ellipsis),
                      leading: Text(response.data[index].id.toString()),
                    );
                  },
                ),
                onRefresh: provider.refresh,
                displacement: 18.0,
            );
          },
        )
    );
  }
}
