import 'package:finalproject_vep/models/provider.dart';
import 'package:finalproject_vep/screens/postscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return Providerdata();
        },
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: Postscreen()));
  }
}
