import 'package:flutter/material.dart';
import 'custom_page.dart';
import 'package:http/http.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomPage() ,
    );
  }
}
