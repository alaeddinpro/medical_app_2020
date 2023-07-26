import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/modules/meddi.dart';

import 'package:medical/screen/selectmedi.dart';

class B extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {

    return Bil();
  }
}

class Bil extends State<B> {
  Note note;
  MediListState ggg;
  bool t=false,t1=false,t2=false;
  static int s,s1,s2,s3,s4,s5,s6,s7,s8;
  int q1,q2,q3,min,m;
  int str=0;
  TextEditingController cont1=TextEditingController();
  TextEditingController cont2=TextEditingController();
  TextEditingController cont3=TextEditingController();
  List<Note> noteList;
  int count = 0;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff00a8ff),
          title: Text("Billan"),
          centerTitle: true,
          elevation: 0,
        ),
      body:
      Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(

            color: Color(0xff00a8ff),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Test results",
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 43,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              shadows: <Shadow>[])),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextField(
                          controller: cont1,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: const BorderSide(),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                              ),
                              enabled: true,
                              hintText: 'Value',
                              hintStyle: TextStyle(
                                color: Color(0xffDDF9E1),
                              ),
                              prefixIcon: Icon(
                                Icons.medical_services_outlined,
                                color: Color(0xffDDF9E1),
                              ),
                              suffix: Text(
                                "  ml/min",
                                style: TextStyle(
                                  color: Color(0xffDDF9E1),
                                ),
                              ),
                              labelText: "Renal clearance ",
                              labelStyle: TextStyle(
                                color: Color(0xffDDF9E1),
                                fontSize: 22,
                              )),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: TextField(
                          controller: cont2,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: const BorderSide(),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                              ),
                              enabled: true,
                              hintText: 'Value',
                              hintStyle: TextStyle(
                                color: Color(0xffDDF9E1),
                              ),
                              prefixIcon: Icon(
                                Icons.local_hospital,
                                color: Color(0xffDDF9E1),
                              ),
                              suffix: Text(
                                "  ml/min",
                                style: TextStyle(
                                  color: Color(0xffDDF9E1),
                                ),
                              ),
                              labelText: "Bilirubin",
                              labelStyle: TextStyle(
                                color: Color(0xffDDF9E1),
                                fontSize: 22,
                              )),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: TextField(
                          controller: cont3,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: const BorderSide(),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                              ),
                              enabled: true,
                              hintText: 'Value',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.local_pharmacy,
                                color: Color(0xffDDF9E1),
                              ),
                              suffix: Text(
                                "  ml/min",
                                style: TextStyle(
                                  color: Color(0xffDDF9E1),
                                ),
                              ),
                              labelText: "Tjp/Tjo",
                              labelStyle: TextStyle(
                                color: Color(0xffDDF9E1),
                                fontSize: 22,
                              )),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:
                            // ignore: deprecated_member_use
                                    RaisedButton(
                                      padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                      color: Color(0xff2198F3),
                                      textColor: Colors.white,
                                      child: Text(
                                        'Select',
                                        textScaleFactor: 1.5,
                                        style: TextStyle(fontSize: 23),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      onPressed: () {

                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (_) {
                                              return GGg();

                                            }
                                        ));
                                      },
                                      splashColor: Colors.deepOrange,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),

                      //Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Go
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child:
                              // ignore: deprecated_member_use
                              RaisedButton(
                                // padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                color: Colors.green[400],
                                textColor: Colors.white,
                                child: Text(
                                  'Result',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(fontSize: 23),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  setState(() {
                                    debugPrint("Result button clicked");
                                    print(clrr(cont1));
                                    print(bil(cont2));
                                    print(tpo(cont3));
                                    if(clrr(cont1)<bil(cont2)&&clrr(cont1)<tpo(cont3))
                                      min=clrr(cont1);
                                    if(bil(cont2)<clrr(cont1)&&bil(cont2)<tpo(cont3))
                                      min=bil(cont2);
                                    if(tpo(cont3)<bil(cont2)&&tpo(cont3)<clrr(cont1))
                                      min=tpo(cont3);
                                    print('$min');
                                    if (cont1.text == "" &&
                                                cont2.text == "" &&
                                                cont3.text == "") {
                                              if (clrr(cont1) <= bil(cont2) &&
                                                  clrr(cont1) <= tpo(cont3)) {
                                                min = clrr(cont1);
                                              }
                                              if (bil(cont2) <= clrr(cont1) &&
                                                  bil(cont2) <= tpo(cont3)) {
                                                min = bil(cont2);
                                              }
                                              if (tpo(cont3) <= clrr(cont1) &&
                                                  tpo(cont3) < bil(cont2)) {
                                                min = tpo(cont3);
                                              }
                                            } else {}
                                            if (cont1.text == '') {
                                              print(" Control clairence is empty");
                                            } else {
                                              if (cont2.text == "" &&
                                                  cont3.text == "") {
                                                min = clrr(cont1);
                                              } else {
                                                if (cont2.text != "" &&
                                                    cont3.text == "") {
                                                  if (clrr(cont1) < bil(cont2))
                                                    min = clrr(cont1);
                                                  else
                                                    min = bil(cont2);
                                                }
                                                if (cont3.text != "" &&
                                                    cont2.text == "") {
                                                  if (clrr(cont1) < tpo(cont3))
                                                    min = clrr(cont1);
                                                  else
                                                    min = tpo(cont3);
                                                }
                                                if (cont2.text != "" &&
                                                    cont3.text != "") {
                                                  if (clrr(cont1) < bil(cont2) &&
                                                      clrr(cont1) < tpo(cont3)) {
                                                    min = clrr(cont1);
                                                  }
                                                }
                                                print(
                                                    "CHIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
                                              }
                                            }

                                            if (cont2.text == '') {
                                              print(" Control BILI is empty");
                                            } else {
                                              if (cont1.text == "" &&
                                                  cont3.text == "") {
                                                min = bil(cont2);
                                              } else {
                                                if (cont1.text != "" &&
                                                    cont3.text == "") {
                                                  if (bil(cont2) < clrr(cont1))
                                                    min = bil(cont2);
                                                  else
                                                    min = clrr(cont1);
                                                }
                                                if (cont3.text != "" &&
                                                    cont1.text == "") {
                                                  if (bil(cont2) < tpo(cont3))
                                                    min = bil(cont2);
                                                  else
                                                    min = tpo(cont3);
                                                }
                                                if (cont1.text != "" &&
                                                    cont3.text != "") {
                                                  if (bil(cont2) < clrr(cont1) &&
                                                      bil(cont2) < tpo(cont3)) {
                                                    min = bil(cont2);
                                                  }
                                                }
                                                print(
                                                    "CHIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
                                              }
                                            }
                                            if (cont3.text == '') {
                                              print(" Control TJO/TJP is empty");
                                            } else {
                                              if (cont1.text == "" &&
                                                  cont2.text == "") {
                                                min = tpo(cont3);
                                              } else {
                                                if (cont1.text != "" &&
                                                    cont2.text == "") {
                                                  if (tpo(cont3) < clrr(cont1))
                                                    min = tpo(cont3);
                                                  else
                                                    min = clrr(cont1);
                                                }
                                                if (cont2.text != "" &&
                                                    cont1.text == "") {
                                                  if (tpo(cont3) < bil(cont2))
                                                    min = tpo(cont3);
                                                  else
                                                    min = bil(cont2);
                                                }
                                                if (cont1.text != "" &&
                                                    cont2.text != "") {
                                                  if (tpo(cont3) < clrr(cont1) &&
                                                      tpo(cont3) < bil(cont2)) {
                                                    min = tpo(cont3);
                                                  }
                                                }
                                                print("");
                                              }
                                            }
                                    _showAlertDialog("Result", "dosage is $min ml/min");
                                  });

                                },
                              ),
                                  // setState(() {
                                  //     print(
                                  //         "TEEEEEEEEEEEEEsT  clRR: ${clrR.text}");
                                  //     print(
                                  //         "TEEEEEEEEEEEEEsT bili  : ${bili.text}");
                                  //     print(
                                  //         "TEEEEEEEEEEEEEsT tjptjo : ${tjptjo.text}");
                                  //
                                  //     if (clrR.text == "" &&
                                  //         bili.text == "" &&
                                  //         tjptjo.text == "") {
                                  //       if (clrr(clrR) <= bil(bili) &&
                                  //           clrr(clrR) <= tpo(tjptjo)) {
                                  //         min = clrr(clrR);
                                  //       }
                                  //       if (bil(bili) <= clrr(clrR) &&
                                  //           bil(clrR) <= tpo(tjptjo)) {
                                  //         min = bil(bili);
                                  //       }
                                  //       if (tpo(tjptjo) <= clrr(clrR) &&
                                  //           tpo(tjptjo) < bil(bili)) {
                                  //         min = tpo(tjptjo);
                                  //       }
                                  //     } else {}
                                  //     if (clrR.text == '') {
                                  //       print(" Control clairence is empty");
                                  //     } else {
                                  //       if (bili.text == "" &&
                                  //           tjptjo.text == "") {
                                  //         min = clrr(clrR);
                                  //       } else {
                                  //         if (bili.text != "" &&
                                  //             tjptjo.text == "") {
                                  //           if (clrr(clrR) < bil(bili))
                                  //             min = clrr(clrR);
                                  //           else
                                  //             min = bil(bili);
                                  //         }
                                  //         if (tjptjo.text != "" &&
                                  //             bili.text == "") {
                                  //           if (clrr(clrR) < tpo(tjptjo))
                                  //             min = clrr(clrR);
                                  //           else
                                  //             min = tpo(tjptjo);
                                  //         }
                                  //         if (bili.text != "" &&
                                  //             tjptjo.text != "") {
                                  //           if (clrr(clrR) < bil(bili) &&
                                  //               clrr(clrR) < tpo(tjptjo)) {
                                  //             min = clrr(clrR);
                                  //           }
                                  //         }
                                  //         print(
                                  //             "CHIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
                                  //       }
                                  //     }
                                  //
                                  //     if (bili.text == '') {
                                  //       print(" Control BILI is empty");
                                  //     } else {
                                  //       if (clrR.text == "" &&
                                  //           tjptjo.text == "") {
                                  //         min = bil(bili);
                                  //       } else {
                                  //         if (clrR.text != "" &&
                                  //             tjptjo.text == "") {
                                  //           if (bil(bili) < clrr(clrR))
                                  //             min = bil(bili);
                                  //           else
                                  //             min = clrr(clrR);
                                  //         }
                                  //         if (tjptjo.text != "" &&
                                  //             clrR.text == "") {
                                  //           if (bil(bili) < tpo(tjptjo))
                                  //             min = bil(bili);
                                  //           else
                                  //             min = tpo(tjptjo);
                                  //         }
                                  //         if (clrR.text != "" &&
                                  //             tjptjo.text != "") {
                                  //           if (bil(bili) < clrr(clrR) &&
                                  //               bil(clrR) < tpo(tjptjo)) {
                                  //             min = bil(bili);
                                  //           }
                                  //         }
                                  //         print(
                                  //             "CHIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
                                  //       }
                                  //     }
                                  //     if (tjptjo.text == '') {
                                  //       print(" Control TJO/TJP is empty");
                                  //     } else {
                                  //       if (clrR.text == "" &&
                                  //           bili.text == "") {
                                  //         min = tpo(tjptjo);
                                  //       } else {
                                  //         if (clrR.text != "" &&
                                  //             bili.text == "") {
                                  //           if (tpo(tjptjo) < clrr(clrR))
                                  //             min = tpo(tjptjo);
                                  //           else
                                  //             min = clrr(clrR);
                                  //         }
                                  //         if (bili.text != "" &&
                                  //             clrR.text == "") {
                                  //           if (tpo(tjptjo) < bil(bili))
                                  //             min = tpo(tjptjo);
                                  //           else
                                  //             min = bil(bili);
                                  //         }
                                  //         if (clrR.text != "" &&
                                  //             bili.text != "") {
                                  //           if (tpo(tjptjo) < clrr(clrR) &&
                                  //               tpo(tjptjo) < bil(bili)) {
                                  //             min = tpo(tjptjo);
                                  //           }
                                  //         }
                                  //         print("");
                                  //       }
                                  //     }
                                  //     _showAlertDialog(
                                  //         '$min', "La Dose Est : $min  ");
                                  //   });
                                  // },
                                  // child: Text("Submit"),
                                ),
                              ]) ],
                              ),
                            ))],
                  ),
                ),
              );

      // Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children:[
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Container(
      //
      //                     width: 150,
      //                     child:TextField(
      //                       controller: cont1,
      //                       decoration:InputDecoration(
      //                         border: OutlineInputBorder(
      //                             borderRadius: BorderRadius.circular(5.0)
      //                         ),
      //                         labelText: "clairence Renal",
      //                       ),
      //                       keyboardType: TextInputType.number,
      //                     )),
      //               Container(
      //                   padding: const EdgeInsets.only(top: 10),
      //                   width: 150,
      //                 child: TextField(
      //                   controller: cont2,
      //                   decoration:InputDecoration(
      //
      //                     border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(5.0)
      //                     ),
      //                     labelText: "bilirubine",
      //                   ),
      //                   keyboardType: TextInputType.number,
      //                 )),]),
      //
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Container(
      //                     width: 150,
      //                     child:TextField(
      //                       controller: cont3,
      //                       decoration:InputDecoration(
      //                         border: OutlineInputBorder(
      //                             borderRadius: BorderRadius.circular(5.0)
      //                         ),
      //                         labelText: "tgo/tgp",
      //                       ),
      //                       keyboardType: TextInputType.number,
      //                     )
      //                   ),
      //
      //
      //
      //         // ignore: deprecated_member_use
      //         RaisedButton(
      //           padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
      //           color: Color(0xff2198F3),
      //           textColor: Colors.white,
      //           child: Text(
      //             'Select',
      //             textScaleFactor: 1.5,
      //             style: TextStyle(fontSize: 23),
      //           ),
      //           onPressed: () {
      //
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (_) {
      //                   return GGg();
      //
      //                 }
      //             ));
      //           },
      //           splashColor: Colors.deepOrange,
      //         ),],
      //   ),
      //         // ignore: deprecated_member_use
      //         RaisedButton(
      //           // padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
      //           color: Color(0xff2198F3),
      //           textColor: Colors.white,
      //           child: Text(
      //             'Result',
      //             textScaleFactor: 1.5,
      //             style: TextStyle(fontSize: 23),
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               debugPrint("Result button clicked");
      //               print(clrr(cont1));
      //               print(bil(cont2));
      //               print(tpo(cont3));
      //               if(clrr(cont1)<bil(cont2)&&clrr(cont1)<tpo(cont3))
      //                 min=clrr(cont1);
      //               if(bil(cont2)<clrr(cont1)&&bil(cont2)<tpo(cont3))
      //                 min=bil(cont2);
      //               if(tpo(cont3)<bil(cont2)&&tpo(cont3)<clrr(cont1))
      //                 min=tpo(cont3);
      //               print('$min');
      //               _showAlertDialog("Result", "dosage est $min ml/min");
      //             });
      //
      //           },
      //         ),
      //
      //
      //       ]),
      // ),
  }
  Bil([int d,int d1,int d2,int d3,int d4,int d5,int d6,int d7,int d8]){
    s=d;
    s1=d1;
    s2=d2;
    s3=d3;
    s4=d4;
    s5=d5;
    s6=d6;
    s7=d7;
    s8=d8;

  }

  int clrr(cont1) {
    q1 = int.parse(cont1.text);
    if (q1 < s) {
      return 0;
    } else {
      if ((s < q1 && q1 < s1))
        return  s2 ;
      else {
        return 100;
      }
    }
  }

   bil(cont2) {
    q2 = int.parse(cont2.text);

    if (q2 < s3) {
      return 0;
    } else {
      if ((s3 < q2 && q2 < s4))
        return s5;
      else {
        return 100;
      }
    }
  }

   tpo(cont3) {
    q3 = int.parse(cont3.text);
    if (q3 < s6) {
      return 0;
    } else {
      if ((s6 < q3 && q3 < s7))
        return s8 ;
      else {
        return 100;
      }
    }
  }
  void _showAlertDialog(String title, dynamic message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
      elevation:24,
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );

  }
}
