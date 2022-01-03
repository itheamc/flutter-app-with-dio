import 'package:flutter/material.dart';
import 'package:flutter_app_with_dio/providers/post_provider.dart';
import 'package:flutter_app_with_dio/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Posts"), centerTitle: true),
        body: RefreshIndicator(
          onRefresh: context.read<PostProvider>().refresh,
          displacement: 18.0,
          child: Consumer<PostProvider>(
            builder: (context, provider, child) {
              final response = provider.response;
              if (response == null) return const Center(child: CircularProgressIndicator());

              if (response.status == null) return ErrorView(message: response.message);

              if (response.status != 200) return ErrorView(message: response.message);

              if (response.data == null || response.data?.length <= 0) return const ErrorView(message: "No data!!");

              return ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(response.data[index].title),
                    subtitle: Text(response.data[index].body,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    leading: Text(response.data[index].id.toString()),
                  );
                },
              );
            },
          ),
        )
    );
  }
}
