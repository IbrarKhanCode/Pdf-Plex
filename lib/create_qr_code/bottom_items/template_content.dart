import 'package:flutter/material.dart';

class TemplateContent extends StatefulWidget {
  const TemplateContent({super.key});

  @override
  State<TemplateContent> createState() => _TemplateContentState();
}

class _TemplateContentState extends State<TemplateContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text('Templates',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: AssetImage('assets/images/templates_qr.png'))
                              ),
                              ),
                          SizedBox(height: 10,),
                          Text('Scan To Connect',style: TextStyle(fontSize: 10),)
                        ],
                      ),
                    );
                  })
          )
        ],
      ),
    );
  }
}
