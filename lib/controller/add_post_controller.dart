import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    idController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    categoryController.dispose();

  }
}