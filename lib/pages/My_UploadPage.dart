import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyUploadPage extends StatefulWidget {
  const MyUploadPage({super.key});

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  bool isLoading = false;
  var captionController = TextEditingController();
  final ImagePicker? _picker = ImagePicker();
  File? _image;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Upload", style:TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, 
            icon: const Icon(Icons.drive_folder_upload),
            color: const Color.fromRGBO(193, 53, 132, 1),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      _imgFromGallery();
                    },

                    child:  GestureDetector(
                      onTap: () {
                        _showImageSourceDialog(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width,
                        color: Colors.grey.withOpacity(.4),
                        child: _image == null  ? const Center(
                          child:  Icon(Icons.add_a_photo, size: 50 ,color: Colors.grey,),
                        ) : Stack(
                          children: [
                            Image.file(_image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.black12,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                    icon: Icon(Icons.highlight_remove),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],),
                      ),
                    )

                  ),

                  Container(
                    margin: const  EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: TextField(
                      controller: captionController,
                      style: const  TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Caption",
                        hintStyle: TextStyle(fontSize: 17, color: Colors.black38),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          isLoading ? Center(child: CircularProgressIndicator()): SizedBox.shrink(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showImageSourceDialog(context);
      //   },
      //   child: const Icon(Icons.camera_alt),
      //   backgroundColor: Colors.blue,
      // ),
    );
  }
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  _imgFromGallery();
                },
              ),
              ListTile(
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _imgFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
