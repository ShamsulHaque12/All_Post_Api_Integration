import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/post_details_model.dart';
import '../services/api_services.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({super.key, required this.id});

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
      body: FutureBuilder<PostDetailsModel?>(
        future: ApiServices.getSingleData(id),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("No data available"));
          }

          var singlePost = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    singlePost.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  Image.network(singlePost.image,height: 100,width: 100,fit: BoxFit.fill,),
                  SizedBox(height: 10,),
                  Text(
                    singlePost.category,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                  ),
                  Text(
                    singlePost.description,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Icon(Icons.star,color: Colors.red,),
                    title: Text(singlePost.rating.rate.toString()),
                    subtitle: Text(singlePost.rating.count.toString()),
                  ),
                  Text(
                    "\$${singlePost.price.toString()}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
