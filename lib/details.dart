import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> itemList = <String>["Tea", "Snacks", "Lunch", "Dinner"];
String defaultvalue = itemList.first;
bool ddflag = false;
bool tf1 = false;
bool tf2 = false;
bool b1=false;
final tf1controller = TextEditingController();

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ConstrainedBox(
        constraints:
            BoxConstraints.expand(width: MediaQuery.of(context).size.width),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Container(
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                          icon: Icon(Icons.keyboard_arrow_down),
                          borderRadius: BorderRadius.circular(20),
                          hint: Text("Select Your Item"),
                          isExpanded: false,
                          elevation: 20,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              print(value);
                              defaultvalue = value!;
                              if (value != null) {
                                print("Executed");
                                print(itemList.first);
                                print(defaultvalue);
                                ddflag = true;
                              } else {
                                ddflag = false;
                              }
                            });
                          },
                          items: itemList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList()),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: ddflag,
                          child: TextField(
                            onChanged: (String? value) {
                              if (value == null || value == "") {
                                setState(() {
                                  tf1 = false;
                                });
                              } else {
                                setState(() {
                                  tf1 = true;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: tf1,
                          child: TextField(

                            onChanged: (String? value) {
                              if (value == null || value == "") {
                                setState(() {
                                  tf2 = false;
                                });
                              } else {
                                setState(() {
                                  tf2 = true;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Tf2")
                            ),
                          )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: tf1&tf2,
                          child:
                          ElevatedButton(onPressed: (){}, child:Text("Submit")
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
