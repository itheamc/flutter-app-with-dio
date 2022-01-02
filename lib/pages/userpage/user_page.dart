import 'package:flutter/material.dart';
import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/repositories/users_repository/user_repository.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          centerTitle: true,
        ),
        body: FutureBuilder<ApiResponse>(
          future: UserRepository.initialize().users(),
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
                    title: Text(data.data[index].name ?? "Unknown"),
                    subtitle: Text(data.data[index].email ?? "N/A", maxLines: 1, overflow: TextOverflow.ellipsis),
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
