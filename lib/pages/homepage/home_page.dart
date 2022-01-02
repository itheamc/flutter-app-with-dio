import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/posts");
                },
                child: const Text("Navigate to Posts")),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/users");
                },
                child: const Text("Navigate to Users")),
          ],
        ),
      )
    );
  }
}
