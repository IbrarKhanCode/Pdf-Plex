import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_plex/core/utils/colors.dart';

class PdfUploadScreen extends StatefulWidget {
  const PdfUploadScreen({super.key});

  @override
  State<PdfUploadScreen> createState() => _PdfUploadScreenState();
}

class _PdfUploadScreenState extends State<PdfUploadScreen> {

  File? _pdfFile;

  Future<void> _pickPdf(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    // if (result != null) {
    //   String pdfPath = result.files.single.path!;
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => SelectTypeScreen(filePath: pdfPath),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign PDF',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade200,
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/pdf.png'),
                SizedBox(
                  height: 10,
                ),
                Text('Sign PDF',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DottedBorder(
                    color: AppColors.primaryColor,
                    strokeWidth: 2,
                    dashPattern: [10, 10],
                    radius: Radius.circular(30),
                    child: GestureDetector(
                      onTap: () {
                        _pickPdf(context);
                      },
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffFFF1F2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Upload PDF File',
                              style: TextStyle(color: AppColors.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
