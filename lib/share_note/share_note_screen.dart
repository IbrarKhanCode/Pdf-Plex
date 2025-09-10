import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pdf_plex/core/utils/colors.dart';

class ShareNoteScreen extends StatefulWidget {
  const ShareNoteScreen({super.key});

  @override
  State<ShareNoteScreen> createState() => _ShareNoteScreenState();
}

class _ShareNoteScreenState extends State<ShareNoteScreen> {
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
                    'Share Note',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Note Name',
                    hintStyle: TextStyle(
                        color: Color(0xff666666), fontWeight: FontWeight.w500),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        maxLines: 6,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Start typing your note here ...",
                            hintStyle: TextStyle(
                                fontSize: 12, color: Color(0xff666666))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                String selectedFormat = "";
                                bool isChecked = false;

                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  final List<String> formats = [
                                    "1 Day",
                                    "1 Week",
                                    "15 Days",
                                    "1 Month",
                                    "Never"
                                  ];

                                  return Dialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.59,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Share Note',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20),
                                                  ),
                                                )),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.07,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                        child: Icon(
                                                      Icons.close,
                                                      size: 20,
                                                      color: Colors.black,
                                                    )),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Custom Link (optional):',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff666666)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText:
                                                      'https://pdfplex.com/note/view',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade100)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red))),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText:
                                                      'Add Your Custom Link',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                  filled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade100)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .red))),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Expire Date:',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff666666)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height * 0.05,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade100),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value: formats.contains(
                                                          selectedFormat)
                                                      ? selectedFormat
                                                      : null,
                                                  hint: Text(
                                                    '1 month',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  items: formats.map((format) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: format,
                                                      child: Text(
                                                        format,
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 13),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      setState(() {
                                                        selectedFormat = value;
                                                      });
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    elevation: 0,
                                                    direction:
                                                        DropdownDirection.left,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey.shade100),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Password:',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff666666)),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText:
                                                  'Enter Password',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                  filled: true,
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(8),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .shade100)),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(8),
                                                      borderSide:
                                                      BorderSide(
                                                          color: Colors
                                                              .red))),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  side: BorderSide(color: Colors.grey),
                                                  checkColor: Colors.white,
                                                    activeColor: AppColors.primaryColor,
                                                    value: isChecked,
                                                    onChanged: (value){
                                                      setState(() {
                                                        isChecked = value!;
                                                      });
                                                    }
                                                    ),
                                                Text('Public (listed in search)',style: TextStyle(color: Colors.grey,fontSize: 10),),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              height: MediaQuery.sizeOf(context).height * 0.05,
                                              width: MediaQuery.sizeOf(context).width,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius: BorderRadius.circular(10)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'SHARE',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, left: 10, right: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xff666666),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
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
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
