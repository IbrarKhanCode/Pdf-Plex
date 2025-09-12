import 'package:flutter/material.dart';
import 'package:pdf_plex/core/utils/colors.dart';

class FileReadyScreen extends StatefulWidget {
  const FileReadyScreen({super.key});

  @override
  State<FileReadyScreen> createState() => _FileReadyScreenState();
}

class _FileReadyScreenState extends State<FileReadyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.35,),
                Text('FILE READY',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(width: MediaQuery.of(context).size.width * 0.16,),
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Container(
                      height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade100),
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.close,size: 30,color: Colors.black,))),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.17,
                        width: MediaQuery.of(context).size.width * 0.27,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/image_converter3.png')),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('d4507c67-6809-485c',style: TextStyle(color: Color(0xff666666),fontWeight: FontWeight.w500,),),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10,),
                              Text(
                                'DOWNLOAD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xff666666),)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10,),
                              Text(
                                'SHARE',
                                style: TextStyle(
                                    color: Color(0xff666666),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
