import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_plex/core/utils/colors.dart';
import 'package:provider/provider.dart';
import '../../provider/qr_style_provider.dart';

class ColorContent extends StatefulWidget {
  const ColorContent({super.key});

  @override
  State<ColorContent> createState() => _ColorContentState();
}

class _ColorContentState extends State<ColorContent> {
  final List<String> bgImage = [
    "assets/images/bg 1.png",
    "assets/images/bg 2.png",
    "assets/images/bg 1.png",
    "assets/images/bg 2.png",
    "assets/images/bg 1.png",
    "assets/images/bg 2.png",
  ];

  final List<Color> backgroundOptions = [
    Color(0xff1ABC9C),
    Color(0xffFF5555),
    Color(0xffD2FF55),
    Color(0xff48FF57),
    Color(0xffFF72AF),
    Color(0xff48B3FF),
    Color(0xffFFC251),
    Color(0xffFF9999),
    Color(0xffE8FFA8),
    Color(0xffB5FFBB),
    Color(0xffFFBBD8),
    Color(0xff839099),
    Color(0xff666666),
    Color(0xff997430),
  ];

  final List<Color> foregroundOptions = [
    Color(0xff2ECC71),
    Color(0xffFF5555),
    Color(0xffD2FF55),
    Color(0xff48FF57),
    Color(0xffFF72AF),
    Color(0xff1E1E1E),
    Color(0xffFFFFFF),
    Color(0xffFF9999),
    Color(0xffE8FFA8),
    Color(0xffB5FFBB),
    Color(0xffFFBBD8),
    Color(0xffDAF0FF),
    Color(0xff666666),
    Color(0xffFFC251),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<QrStyleProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Foreground",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              height: 120,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemCount: foregroundOptions.length,
                  itemBuilder: (context, index) {
                    final color = foregroundOptions[index];
                    return GestureDetector(
                      onTap: () {
                        context.read<QrStyleProvider>().setForeground(color);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: colors.foregroundColor == color
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade100,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Background",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              height: 120,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemCount: backgroundOptions.length,
                  itemBuilder: (context, index) {
                    final color = backgroundOptions[index];
                    final colors = context.watch<QrStyleProvider>();
                    return GestureDetector(
                      onTap: () {
                        context.read<QrStyleProvider>().setBackground(color);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: colors.backgroundImage == null &&
                                  colors.backgroundColor == color
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade100,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    );
                  })),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    context.read<QrStyleProvider>().setBackgroundImage(File(image.path));
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Image.asset('assets/images/gallery.png'),
                ),
              ),
              SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ListView.builder(
                      itemCount: bgImage.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(bgImage[index]))),
                          ),
                        );
                      }))
            ],
          ),
        ],
      ),
    );
  }
}