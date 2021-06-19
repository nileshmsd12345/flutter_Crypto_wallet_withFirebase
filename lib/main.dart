import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_crypto_wallet/ui/authentication.dart';
import 'package:flutter_crypto_wallet/ui/home_view.dart';
import 'package:flutter_crypto_wallet/ui/add_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Crypto Wallet',
      home: Authentication(),
    );
  }
}


