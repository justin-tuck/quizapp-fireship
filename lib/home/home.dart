import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text(
          'topics',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onPressed: () =>
            Navigator.pushNamed(context, '/topics'), // routing to about page
      ),
    ));
  }
}
