import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../Model/post_model.dart';

class MyFeedPage extends StatefulWidget {
  final PageController? pageController;
  const MyFeedPage({Key? key , this.pageController}) : super(key : key);

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {

  bool isLoading = false;
  List<Post> items = [];
  String image_1 = "https://images.unsplash.com/photo-1702427725739-4282dcc3e8e0";
  String image_2 = "https://images.unsplash.com/photo-1682686581776-b6ebee7c150e";
  String image_3 = "https://images.unsplash.com/photo-1702571202424-84d58143cfcc";
  
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
        title: const Text("Instagram", style: TextStyle(color: Colors.black,
            fontFamily: "Billabong", fontSize: 30),),
        actions: [
          IconButton(
              onPressed: (){
                widget.pageController!.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              },
              icon: const Icon(Icons.camera_alt),
             color: const Color.fromRGBO(193, 53, 132, 1),
          ),
        ],
      ),
      body: Stack(
        children: [
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx , index){
                return _itemOfPost(items[index]);
              }
            ),
          isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _itemOfPost(Post post){
     return Container(
      color: Colors.white,
       child: Column(
         children: [
           const Divider(),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.circular(40),
                       child: const Image(
                         image: AssetImage("assets/images/user.png"),
                         height: 40,
                         width: 40,
                       ),
                     ),
                     const SizedBox(width: 10,),
                     const Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Faxriddinov Og'abek", style:
                         TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                         SizedBox(height: 3,),
                         Text("2023.12.19 21:20", style:
                         TextStyle(fontWeight: FontWeight.normal,),),
                       ],
                     ),
                   ],
                 ),

                 IconButton(
                     onPressed: (){},
                     icon: const Icon(Icons.more_horiz),
                 ),
               ],
             ),
           ),
           // #user Info
           SizedBox(height: 8,),
           CachedNetworkImage(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.width,
             imageUrl: post.img_post!,
             placeholder: (context, url) => const Center(
               child: CircularProgressIndicator(),
             ),
             errorWidget: (context, url, error) => const Icon(Icons.error),
             fit: BoxFit.cover,
           ),

         //   #like share
          Row(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){},
                      icon: Icon(EvaIcons.heart,
                        color: Colors.red,
                      ),
                  ),
                  IconButton(onPressed: (){},
                    icon: Icon(EvaIcons.shareOutline,
                    ),
                  ),
                ],
              )
            ],
          ),
         //   #caption
           Container(
             width: MediaQuery.of(context).size.width,
             margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
             child: RichText(
               softWrap: true,
               overflow: TextOverflow.visible,
               text: TextSpan(
                 text: "${post.caption}",
                 style: const TextStyle(color: Colors.black ),
               ),
             ),
           ),
           const SizedBox(height: 2,),

         ],
       ),

     );

  }
}
