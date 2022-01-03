import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String? message;

  const ErrorView({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Center(child: Text(message ?? "")),
          ),
        );
      }
    );
  }
}
