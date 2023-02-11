import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPickImageScreen extends StatefulWidget {
  const MyPickImageScreen({Key? key}) : super(key: key);


  @override
  _MyPickImageScreenState createState() => _MyPickImageScreenState();
}

class _MyPickImageScreenState extends State<MyPickImageScreen> {

  List<XFile>? imgPickerlist=[];


  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: const Text("Capture Image From Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: const Text("Take Image From Gallery"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  openCamera() async {
    final XFile? tempimage=await ImagePicker().pickImage(source: ImageSource.camera);
    if(tempimage!=null)
      {
        imgPickerlist!.add(tempimage);
        setState(() {
        });
      }else{
    }
    Navigator.pop(context);
  }

  openGallery() async {
    final List<XFile>? imgsGallery=await ImagePicker().pickMultiImage();
    if(imgsGallery!=null) {
      imgPickerlist!.addAll(imgsGallery);
      setState(() {});
    }
    Navigator.pop(context);
  }

  Widget displayImage(){
    if(imgPickerlist!.isEmpty)
      return Text("No Selected Images");
    else{
      return Container(
        height: 200,
        width: 200,
        child: GridView.builder(
            itemCount: imgPickerlist!.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return Image.file(File(imgPickerlist![index].path),
                  fit: BoxFit.cover);
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            displayImage(),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                showOptionsDialog(context);
              },
              child: const Text("Select Image"),
            )
          ],
        ),
      ),
    );
  }

}