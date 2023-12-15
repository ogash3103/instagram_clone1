import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/My_UploadPage.dart';
import 'package:instagram_clone/pages/My_likePage.dart';
import 'package:instagram_clone/pages/My_porfile.dart';
import 'package:instagram_clone/pages/myScharchPage.dart';
import 'package:instagram_clone/pages/my_feedPage.dart';

class HomaPage extends StatefulWidget {

  static const String id = "home_page";
  const HomaPage({ Key? key}) : super(key: key);

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  PageController? pageController ;
  int _currentTap = 0;
  @override
  void initState() {
      super.initState();
      pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          MyFeedPage(),
          MySearchPage(),
          MyUploadPage(),
          MyLikePage(),
          MyProfilePage()
        ],
        onPageChanged: (int index){
          setState(() {
            _currentTap = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index){
          setState(() {
            _currentTap = index;
            pageController!.animateToPage(index, duration: Duration(microseconds: 200),
                curve: Curves.easeIn);
          });

        },
        activeColor: Color.fromRGBO(193, 53, 132, 1),
        currentIndex: _currentTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            size: 32,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                size: 32,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box,
                size: 32,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                size: 32,)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,
                size: 32,)
          ),
        ],
      ),
    );
  }
}
