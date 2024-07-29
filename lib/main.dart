import 'package:flutter/material.dart';
import 'screen/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade200,
          title: const Center(child: Text('Register page')),
        ),
        body: const LoginPage(),
      ),
    );
  }
}
