import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pdf_plex/core/utils/colors.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {

  int selectedIndex = 0;
  final TextEditingController _previewController = TextEditingController();
  String enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            
                : Center(child: Text('Draw Section')),
          ],
        ),
      ),
    );
  }
}
