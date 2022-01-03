import 'package:flutter/material.dart';
import 'package:flutter_app_with_dio/pages/homepage/home_page.dart';
import 'package:flutter_app_with_dio/pages/postpage/post_page.dart';
import 'package:flutter_app_with_dio/pages/userpage/user_page.dart';
import 'package:flutter_app_with_dio/providers/post_provider.dart';
import 'package:flutter_app_with_dio/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        title: "App With Dio",
        home: const HomePage(),
        routes: {
          '/posts': (_) => const PostsPage(),
          '/users': (_) => const UsersPage()
        },
      ),
    );
  }
}
