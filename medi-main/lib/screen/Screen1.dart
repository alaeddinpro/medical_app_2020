import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:medical/main.dart';
import 'package:medical/moreinfo.dart';
import 'package:medical/screen/spastient.dart';
import '../bil.dart';
import 'medi.dart';


class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Hi Doctor",
        description: "The application is specially designed for you to help you perform your work quickly,The first screen to add the drug to the drug list",
        pathImage: "images/78.png",
        backgroundColor: Color(0xff00a8ff),
      ),
    );
    slides.add(
      new Slide(
        title: "Hi Doctor",
        description: "The second screen after filling out the analyzes helps you choose the right medication for the patient",
        pathImage: "images/79.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "Rules",
        description:
        "The last screen helps you give the patient the right dose of medicine. This application is designed for use by doctors only",
        pathImage: "images/80.png",
        backgroundColor: Color(0xff353b48),
      ),
    );
  }

  void onDonePress() {
    print("Done Pressed");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
    // TODO: go to next screen
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   // title: Text(("App")),
        //   centerTitle: true,
        //   backgroundColor: Color(0xff0984E3),
        //   elevation: 0,
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/65.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Positioned(
                left: 66, top: 475,
                width: 80,
                height: 80,


                child:
                Container(
                  decoration:new BoxDecoration(
                    color: Colors.white,
                     borderRadius: new BorderRadius.circular(23.0),

                      image: DecorationImage(
                      image: AssetImage('images/Medicine_1.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) {
                              return NoteList();
                            }
                        ));
                      },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                      ),
                ),
            ),
            Positioned(
                right: 75,top: 475,
                width: 80,
                height: 80,

                child: Container(
                  decoration:new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(23.0),
                    image: DecorationImage(
                      image: AssetImage('images/vaccine_1.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                // ignore: deprecated_member_use
                child: FlatButton(
                onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) {
                    return B();
                    }
                    ));
                    },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
             )
            ),
            Positioned(
                left: 66,bottom: 150,
                width: 80,
                height: 80,

                child: Container(
                  decoration:new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(23.0),
                    image: DecorationImage(
                      image: AssetImage('images/33.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) {
                              return Ppp();
                            }
                        ));
                      },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                      ),
                )
            ),
            Positioned(
                right: 75,bottom: 150,
                width: 80,
                height: 80,

                child: Container(
                  width: 50,
                  height: 50,
                  decoration:new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(23.0),

                    image: DecorationImage(
                      image: AssetImage('images/889.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) {
                              return Moreinfo();
                            }
                        ));
                      }, splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,),
                )
            ),


          ]),
        ));
  }
}



