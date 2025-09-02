import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
        title: Text("Details Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
