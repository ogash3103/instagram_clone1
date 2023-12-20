import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/post_model.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  List<Post> items = [];
  bool isLoading = false;
  int axisCount = 3;
  File? _image;
  String? fullName = "Ogabek" , email = "fax@gmail.com", img_url;
  int? count_posts , count_followers, count_following ;
  String image_1 = "https://images.unsplash.com/photo-1702427725739-4282dcc3e8e0";
  String image_2 = "https://images.unsplash.com/photo-1682686581776-b6ebee7c150e";
  String image_3 = "https://images.unsplash.com/photo-1702571202424-84d58143cfcc";
  final ImagePicker? _picker = ImagePicker();
  void _setImage(XFile? image) {
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }
  _imgFromGallery() async{
    XFile? image = await _picker?.pickImage(source: ImageSource.gallery, imageQuality: 50);
    _setImage(image);
  }
  _imgFromCamera() async {
    final XFile? image = await _picker?.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    _setImage(image);
  }
  @override
  void initState() {
      super.initState();
      items.add(Post(image_1, "Best photo I have ever seen"));
      items.add(Post(image_2, "Best photo you have ever seen"));
      items.add(Post(image_3, "Best photo they have ever seen"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const  Text("Search",
          style: TextStyle(color: Colors.black, fontFamily: "Billabong", fontSize: 25),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.exit_to_app),
            color: const Color.fromRGBO(193, 53, 132, 1),
          ),
        ],
      ),
      body: Stack(
        children: [
            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                //   #myPhoto
                  GestureDetector(
                    onTap: (){},
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            border: Border.all(
                              width: 1.5,
                              color: const  Color.fromRGBO(193, 53, 132, 1),
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: _image == null  ? Image(
                                image:  AssetImage("assets/images/user.png"),
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ) :  Image.file(_image!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          child: const  Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.purple,

                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                //  #myInfoes
                const SizedBox(height: 10,),
                  Text(fullName!.toUpperCase(),
                    style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 3,),
                  Text(email!.toUpperCase(),
                    style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                //   myCounts
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Text(count_posts.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black
                                ),),
                               const  SizedBox(height: 3,),
                                const Text("POST", style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),)
                              ],
                            ),
                          ),
                        ),


                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Text(count_followers.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black
                                  ),),
                                const  SizedBox(height: 3,),
                                const Text("FOLLOWERS", style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),)
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Text(count_following.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black
                                  ),),
                                const  SizedBox(height: 3,),
                                const Text("FOLLOWING", style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child:  OverflowBar(
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildIconButton(Icons.grid_view, 1),
                            buildIconButton(Icons.grid_on_sharp, 3),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  Expanded(
                    child: GridView.builder(
                        itemCount: items.length,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: axisCount),
                        itemBuilder: (ctx, index){
                          return _itemOfPost(items[index]);
                        },
                    ),
                  ),
                ],
              ),

            ),
        ],
      ),

    );
  }
  Widget buildIconButton(IconData icon, int iconIndex) {
    return IconButton(
      onPressed: () {
        setState(() {
          axisCount = iconIndex;
        });
      },
      icon: Icon(icon),
      color: axisCount == iconIndex ? const Color.fromRGBO(193, 53, 132, 1) : Colors.grey,
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: post.img_post!,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url ,error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 3,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(post.caption!, style: TextStyle(color: Colors.black87.withOpacity(.7),),
                maxLines: 2,),
            ],
          )

        ],
      ),
    );
  }

}
