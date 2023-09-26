import 'package:firstapp/pages/page1.dart';
import 'package:firstapp/pages/page2.dart';
import 'package:firstapp/pages/page3.dart';
import 'package:firstapp/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int position = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    position = value;
                  });
                },
                children: const [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page()
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: position,
              items:const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              ]
              )
          ],
        ),
        appBar:
          AppBar(
            title: const Text("Main Page"),
      ),),
    );
  }
}