import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isShow = false;
  double xOffset = 0.99;
  double yOffset = 0.99;
  Color startColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 1,
                width: size.width * 1,
                color: Colors.grey,
                //alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('images/MYPICTURE.png'),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Acharf'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Home'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('settings'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),

              /// shift this layer from the top.

              AnimatedContainer(
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 1),
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(isShow ? 0.85 : 1.0)
                  ..rotateZ(isShow ? -50 : 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isShow
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30))
                      : BorderRadius.zero,
                ),
                height: size.height * 1,
                width: size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: isShow
                          ? const Icon(Icons.menu)
                          : const Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                          if (isShow) {
                            xOffset = 300;
                            yOffset = 80;
                          } else {
                            xOffset = 0;
                            yOffset = 0;
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 2,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          index++;
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('images/$index.png'),
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              alignment: Alignment.lerp(
                isShow ? Alignment.topLeft : Alignment.center,
                isShow ? Alignment.centerLeft : Alignment.center,
                isShow ? size.width * widthOfTopLayer / 2 : 0,
              )!,
              child: Container(
                height: !isShow
                    ? size.height * heightOfTopLayer
                    : size.width * widthOfTopLayer / 2,
                width: !isShow
                    ? size.width * widthOfTopLayer
                    : size.height * heightOfTopLayer / 2,
                color: isShow ? startColor : Colors.grey,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    index++;
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('images/$index.png'),
                          )),
                    );
                  },
                ),
              ),
            ),
*/