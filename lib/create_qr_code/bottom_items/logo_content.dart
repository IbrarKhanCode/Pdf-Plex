import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_plex/provider/qr_style_provider.dart';
import 'package:provider/provider.dart';

class LogoContent extends StatefulWidget {
  const LogoContent({super.key});

  @override
  State<LogoContent> createState() => _LogoContentState();
}

class _LogoContentState extends State<LogoContent> {
  final List<String> logoOptions = [
    'assets/images/ban_icon.png',
    'assets/images/gallery.png',
    'assets/images/Whatsapp.png',
    'assets/images/Twitter.png',
    'assets/images/Thread.png',
    'assets/images/Facebook.png',
    'assets/images/Dribble.png',
    'assets/images/Linkedin.png',
    'assets/images/Behance.png',
    'assets/images/Snapchat.png',
    'assets/images/Facebook.png',
    'assets/images/Dribble.png',
    'assets/images/Linkedin.png',
    'assets/images/Behance.png',
    'assets/images/Snapchat.png',
    'assets/images/Facebook.png',
    'assets/images/Dribble.png',
    'assets/images/Linkedin.png',
    'assets/images/Behance.png',
    'assets/images/Snapchat.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            itemCount: logoOptions.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (context, index) {
              final logo = logoOptions[index];
              return GestureDetector(
                onTap: () async {
                  if(logo.endsWith('gallery.png')){
                    final picker = ImagePicker();
                    final picked = await picker.pickImage(source: ImageSource.gallery);
                    if(picked != null){
                      context.read<QrStyleProvider>().setLogoFile(File(picked.path));
                    }
                  } else {
                    context.read<QrStyleProvider>().setLogo(logo);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Center(
                      child: Image.asset(logo),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}