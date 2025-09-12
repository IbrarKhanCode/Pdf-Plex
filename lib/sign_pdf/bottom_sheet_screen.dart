import 'dart:ffi';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pdf_plex/core/utils/colors.dart';
import 'package:signature/signature.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {

  final SignatureController signatureController = SignatureController(

    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,

  );

  final List<String> fonts = [
    "Poppins",
    "Aclonica",
    "Ribeye",
    "Baloo2",
    "Lobster",
    "RalewayDots",
  ];

  final TextEditingController _previewController = TextEditingController();
  int selectedIndex2 = 0;
  double fontsSize = 20;
  int selectedIndex = 0;
  String enteredText = '';

  @override
  void initState() {
    super.initState();
    signatureController.addListener((){
      setState(() {

      });
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                      )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add Signature',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.15,
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
            Divider(
              color: Colors.grey.shade200,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: selectedIndex == 0 ? AppColors.primaryColor : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(child: Text('TYPE',style: TextStyle(color:
                    selectedIndex == 0 ? Colors.white : Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),)),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: selectedIndex == 1 ? AppColors.primaryColor : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(child: Text('DRAW',style: TextStyle(color:
                    selectedIndex == 1 ? Colors.white :  Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            selectedIndex == 0 ?
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _previewController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Type here',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        filled: true,
                        enabledBorder:
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade100)),
                        focusedBorder:
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          enteredText = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DottedBorder(
                      color: Colors.grey.shade300,
                      strokeWidth: 2,
                      dashPattern: [10, 10],
                      radius: Radius.circular(15),
                      borderType: BorderType.RRect,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text(
                            enteredText.isEmpty ?
                            'Preview' : enteredText,
                            style: TextStyle(
                                color: Colors.black,fontSize: fontsSize,
                                fontFamily: fonts[selectedIndex2],fontWeight: FontWeight.w500,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fonts.length,
                        itemBuilder: (context,index){

                        final isSelected = selectedIndex2 == index;

                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedIndex2 = index;
                            });
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: isSelected ? AppColors.primaryColor
                                  : Colors.grey.shade300),
                                ),
                                child: Center(child: Text('Aa',style: TextStyle(
                                  color: Colors.grey,fontFamily: fonts[index],
                                  fontSize: 18,fontWeight: FontWeight.w600,
                                ),),),
                              ),
                            ],
                          ),
                        );
                    }),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.05,
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Slider(
                          max: 70,
                            min: 10,
                            divisions: 60,
                            activeColor: AppColors.primaryColor,
                            label: fontsSize.round().toString(),
                            value: fontsSize,
                            onChanged: (value){
                             setState(() {
                               fontsSize = value;
                             });
                            }
                            ),
                      ),
                    ],
                  )
                ],
              ),
            )

                : DottedBorder(
                 strokeWidth: 2,
                color: Colors.grey.shade200,
                dashPattern: [10,8],
                radius: Radius.circular(15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.77,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Stack(
                    children: [
                      if(signatureController.isEmpty)
                        Center(
                            child: Text('Draw Here'),
                        ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            signatureController.undo();
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,right: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,

                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.undo,size: 20,),
                                  SizedBox(width: 5,),
                                  Text('Undo',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Signature(
                          controller: signatureController,
                        backgroundColor: Colors.transparent,
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.9,
                      )
                    ],
                  )
            )),
          ],
        ),
      ),
    );
  }
}
