import 'package:flutter/material.dart';
import 'package:pdf_plex/create_qr_code/create_qr_screen.dart';
import 'package:pdf_plex/provider/qr_style_provider.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(
    ChangeNotifierProvider(
        create: (_) => QrStyleProvider(),
        child: const  MyApp()
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: CreateQrScreen(),
    );
  }
}
