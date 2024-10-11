import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../SignUpScreen/Business_Hours_Scrren.dart';
import 'content_model.dart';


class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Container(
                  color: contents[i].color,
                  child: Column(
                    children: [
                      Container(
                        height: screenwidth * 1.2,
                        child: SvgPicture.asset(
                          contents[i].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: screenwidth * 0.91,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Text(
                                    contents[i].title,
                                    style: GoogleFonts.lato(
                                      textStyle:TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    contents[i].description,
                                    textAlign: TextAlign.center,
                                    style:GoogleFonts.lato(
                                      textStyle :TextStyle(
                                      fontSize: 15
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        contents.length,
                                            (index) => buildDot(index, context),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:screenwidth * 0.15,
                                    margin: EdgeInsets.symmetric(horizontal:40, vertical: 30),
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (currentIndex == contents.length - 1) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => BusinessHoursScreen(),
                                            ),
                                          );
                                        }
                                        _controller.nextPage(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: contents[i].color, // Button background color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                      ),
                                      child: Text('Join the movement!',
                                        style:GoogleFonts.lato(
                                          textStyle :TextStyle(
                                            fontSize: 18,
                                            color: Colors.white
                                          ),
                                        )),
                                      // child: Text(
                                      //     currentIndex == contents.length - 1 ? "Continue" : "Next"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}