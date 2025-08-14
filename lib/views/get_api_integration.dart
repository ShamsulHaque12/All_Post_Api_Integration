import 'package:apiintegration/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import 'add_post.dart';
import 'details_screen.dart';

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  _ApiIntegrationState createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 200).floor();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API Integration",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<List<PostModel>?>(
        future: ApiServices.fetchData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitRotatingCircle(
              color: Colors.red,
              size: 50.0,
              duration: Duration(seconds: 2),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var post = snapshot.data![index];
              return InkWell(
                onTap: (){
                  Get.to(()=>DetailsScreen(
                    id: post.id.toString(),
                  ));
                },
                child: Expanded(
                  child: Card(
                    surfaceTintColor: Colors.red,
                    semanticContainer: true,
                    borderOnForeground: true,
                    elevation: 5,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            post.image,
                            height: 70,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 10),
                          Text(
                            post.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5,),
                          Text(post.category!,style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text(
                            "${post.price}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Get.to(()=>AddPost(

            ));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
