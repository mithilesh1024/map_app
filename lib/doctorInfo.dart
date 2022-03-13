import 'package:flutter/material.dart';
import 'main.dart';

class DoctorInfo extends StatelessWidget {
  int index;
  String name;
  String type;
  String address;
  double rating;
  int price;

  DoctorInfo(this.index,this.name, this.type, this.address, this.rating, this.price);  // class constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(    //Sized box to Constraint the size to given height and width
      height: MediaQuery.of(context).size.height-10,    //MediaQuery.of(context).size.height is used to get height of device
      width: MediaQuery.of(context).size.width,         //MediaQuery.of(context).size.width is used to get width of device
      child: Stack(     // Its is used to stack one widget over other
        children: <Widget>[
          Positioned(       // It is used to position the widget in stack
            bottom: MediaQuery.of(context).size.width / 10,
            left: MediaQuery.of(context).size.width / 9,
            child: Container(
              height: 200,
              width: 320,
              decoration: BoxDecoration(
                color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white.withOpacity(0.6):Colors.black.withOpacity(0.6),    //To check if dark mode is enabled or not
                borderRadius: BorderRadius.circular(15.0),    // to make the edges circular
                border: Border.all(
                    color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white10.withAlpha(80):Colors.black12.withAlpha(80)   //To check if dark mode is enabled or not
                ),
                boxShadow: [
                  BoxShadow(
                    color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white.withAlpha(100):Colors.black.withAlpha(100),    //To check if dark mode is enabled or not
                    blurRadius: 10.0,     //To blur the shadow
                    spreadRadius: 0.0
                  )
                ]
              ),
              child: Padding(       // Its is used to leave gap
                padding: const EdgeInsets.all(10.0),    // this will give padding in all directions
                child: Column(      //Arrange widget in vertical direction
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,   //All the elements are equally spaced in column
                  crossAxisAlignment: CrossAxisAlignment.start,       // All the elements will start from left hand side
                  children: <Widget>[
                    Row(        // Arrange widget in horizontal direction
                      children: <Widget>[
                        Text(
                          "$index.",        //Sr no. of the container
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(       // used to add space between widget
                          width: 170,
                        ),
                        Text(
                          "~3.2km~",    //Distance
                          style: TextStyle(
                            fontSize: 16,
                            color: MyApp.themeNotifier.value == ThemeMode.light?Colors.blue:Colors.pink,  //To check if dark mode is enabled or not
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.bookmark,   //bookmark icon
                          color: Colors.red,
                        )
                      ],
                    ),
                    Text(
                      "${this.name}",       //name of doctor
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "${this.type} | ",    //type of doctor
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${this.rating} ",    //rating of doctor
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.thumb_up,     //thumbs up icon
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    Text(
                      "${this.address}",
                      style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                    ),
                    Divider(    // to put horizontal line
                      color: MyApp.themeNotifier.value == ThemeMode.light?Colors.black:Colors.white,  //To check if dark mode is enabled or not
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,    //All the elements are equally spaced in row
                      children: <Widget>[
                        Icon(
                          Icons.message,
                          color: MyApp.themeNotifier.value == ThemeMode.light?Colors.black:Colors.white,  //To check if dark mode is enabled or not
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.video_call,
                          color: MyApp.themeNotifier.value == ThemeMode.light?Colors.black:Colors.white,  //To check if dark mode is enabled or not
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.phone,
                          color: MyApp.themeNotifier.value == ThemeMode.light?Colors.black:Colors.white,  //To check if dark mode is enabled or not
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(    //it contains the price
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.green[300], //To check if dark mode is enabled or not and give border color
                              width: 3,   // thickness of border
                            ),
                            color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.transparent,  //To check if dark mode is enabled or not
                            boxShadow: [
                              MyApp.themeNotifier.value == ThemeMode.light? //To check if dark mode is enabled or not
                              BoxShadow(
                                offset: Offset(     // to draw the shadow
                                  4.0,      // how much to right
                                  4.0       // how much to bottom
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 0.0
                              ):BoxShadow()
                            ],
                            borderRadius: BorderRadius.circular(15.0),  //To make borders rounded
                          ),
                          child: Center(
                            child: Text(
                              "Rs.${this.price}",   // Price
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,    //to make text bold
                                  fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 2.01,
            left: MediaQuery.of(context).size.width / 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55.0),    //To make borders rounded
              ),
              height: 65,
              width: 65,
              child: CircleAvatar(    //gives circular image
                radius: 16.0,
                // network image grabs image from the given url
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1612531385446-f7e6d131e1d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZG9jdG9yJTIwbWFza3xlbnwwfHwwfHw%3D&w=1000&q=80"),
                backgroundColor: Colors.transparent,
              )
            ),
          ),
        ],
      ),
    );
  }
}
