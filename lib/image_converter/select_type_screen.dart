import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SelectTypeScreen extends StatefulWidget {
  final String filePath;
  const SelectTypeScreen({super.key, required this.filePath});

  @override
  State<SelectTypeScreen> createState() => _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {

  String selectedFormat = "";
  final List<String> formats = ["Png", "jpg", "webp", "gif", "ICO"];

  @override
  Widget build(BuildContext context) {

    final fileName = widget.filePath.split('/').last;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  'Image-Converter',
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
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage('assets/images/image_converter2.png'))
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              fileName,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                          ),
                          Text('Image Size: 10mb',style: TextStyle(color: Colors.grey,fontSize: 10,),),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text('Convert to:',style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      value: formats.contains(selectedFormat) ? selectedFormat : null,
                      hint: Text('Select a format',style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w400),),
                      items: formats.map((format) {
                        return DropdownMenuItem<String>(
                          value: format,
                          child: Text(
                            format,
                            style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 13),
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
                      buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        elevation: 0,
                        direction: DropdownDirection.left,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade100),
                          color: Colors.white,
                        ),

                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
