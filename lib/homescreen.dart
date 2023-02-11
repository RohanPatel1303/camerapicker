import 'package:camerapicker/details.dart';
import 'package:camerapicker/imagepick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:(){
              Get.to(PickImage());
            },
                child: Text("Select Image")),
            ElevatedButton(onPressed:(){
              Get.to(DetailScreen());
            },
                child: Text("Details Screen"))
          ],
        ),
      ),
    );;
  }
}
