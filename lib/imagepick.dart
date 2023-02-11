import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  List<XFile>? imagelist=[];
pick_image_camera()async{

  final XFile? selected_image=await ImagePicker().pickImage(source: ImageSource.camera);
  if(selected_image!=null){
    imagelist!.add(selected_image);
    setState(() {
    });
  }
}
 pick_image()async{

      final List<XFile>? selected_images=await ImagePicker().pickMultiImage();
      if(selected_images!.isNotEmpty){
        imagelist!.addAll(selected_images);
        setState(() {
        });
      }



  }
  Future choicepick(){
   return showModalBottomSheet(context: context, builder:(BuildContext context){

     return Container(
       alignment: Alignment.center,
       height:100,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           GestureDetector(
             onTap: (){pick_image();Navigator.pop(context);},
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                   children: [
                     Icon(Icons.image),
                     Text("Gallery"),
                   ],
                 )
               ],
             ),
           ),
           GestureDetector(
             onTap: (){pick_image_camera();Navigator.pop(context);},
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                   children: [
                     Icon(Icons.camera_alt),
                     Text("Camera"),
                   ],
                 )
               ],
             ),
           )
         ],
       ),

     );
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Screen"),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child:
              GridView.builder(
                  itemCount: imagelist!.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(File(imagelist![index].path),
                      fit: BoxFit.cover);
                  }),
              ),
              Expanded(
                flex: 1,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(onPressed: (){choicepick();}, child: Text("Select Images")
                      ),
                    ],
                  )
              ),

            ],
          ),
        ),
      )
    );
  }
}

