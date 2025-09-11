import 'package:flutter/material.dart';
import 'package:pdf_plex/core/utils/colors.dart';
import 'package:pdf_plex/create_qr_code/bottom_items/color_content.dart';
import 'package:pdf_plex/create_qr_code/bottom_items/logo_content.dart';
import 'package:pdf_plex/create_qr_code/bottom_items/template_content.dart';
import 'package:pdf_plex/create_qr_code/qr_code_generated_screen.dart';
import 'package:pdf_plex/provider/qr_style_provider.dart';
import 'package:pdf_plex/widgets/bottom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EditQrScreen extends StatefulWidget {
  const EditQrScreen({super.key});

  @override
  State<EditQrScreen> createState() => _EditQrScreenState();
}

class _EditQrScreenState extends State<EditQrScreen> {
  int? selectedIndex;

  final List<String> titles = [
    "Template",
    "Color",
    "Customize",
    "Logo",
  ];

  final List<String> images = [
    "assets/images/templates.png",
    "assets/images/color.png",
    "assets/images/customize.png",
    "assets/images/logo.png",
  ];

  final List<Widget> bottomWidgets = [
    TemplateContent(),
    ColorContent(),
    Center(child: Text("Customize Content", style: TextStyle(fontSize: 18))),
    LogoContent(),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<QrStyleProvider>();

    final ImageProvider? embedded = colors.logoFile != null
        ? FileImage(colors.logoFile!) as ImageProvider
        : (colors.logoAsset != null ? AssetImage(colors.logoAsset!) : null);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/images/quit_icon.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Your qr is not saved are you\n '
                                        'want to quit !',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10,),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>QrCodeGeneratedScreen()));
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 138,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(color: AppColors.primaryColor),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(child: Text('Yes',style: TextStyle(color: AppColors.primaryColor),),),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 138,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Center(child: Text('No',style: TextStyle(color: Colors.white),),),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    )),
                Text(
                  'Edit Qr Code',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Group.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Qr Preview',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: colors.backgroundImage == null
                        ? colors.backgroundColor
                        : null,
                    image: colors.backgroundImage != null
                        ? DecorationImage(
                            image: FileImage(colors.backgroundImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: QrImageView(
                    data: 'Your QR data here',
                    version: QrVersions.auto,
                    eyeStyle: QrEyeStyle(color: colors.foregroundColor,
                    eyeShape: QrEyeShape.square),
                    dataModuleStyle: QrDataModuleStyle(color: colors.foregroundColor,
                    dataModuleShape: QrDataModuleShape.square),
                    embeddedImage: embedded,
                    embeddedImageStyle: QrEmbeddedImageStyle(size: Size(30, 30)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: selectedIndex == null
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          titles.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: BottomWidgets(
                                title: titles[index],
                                image: images[index],
                                isSelected: selectedIndex == index,
                                onTapped: () => setState(() {
                                  selectedIndex = index;
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: bottomWidgets[selectedIndex!],
                  ),
          ),
        ],
      ))
    );
  }
}

// Color(0xff995C5C),
// Color(0xff8B9965),
// Color(0xff6C9970),
// Color(0xff997082),
// Color(0xffDAF0FF),
// Color(0xffFFFFFF),
// Color(0xffFFC251),
