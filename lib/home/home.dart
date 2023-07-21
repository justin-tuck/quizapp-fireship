import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text('about'),
        onPressed: () =>
            Navigator.pushNamed(context, '/about'), // routing to about page
      ),
    ));
  }
}
