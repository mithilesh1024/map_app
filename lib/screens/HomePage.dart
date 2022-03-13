import 'package:flutter/material.dart';
import 'package:map_app/bottomNavigation.dart';
import 'package:map_app/dummyData.dart';
import '../doctorInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../main.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<DoctorData> result = [];    // the data is stored in list of type DoctorData
  static List<DoctorData> filteredData = [];  //filtered data will be stored here
  static ValueNotifier<List<DoctorData>> filterNotifier = new ValueNotifier<List<DoctorData>>(result);  //to notify to rebuild listView. initial value is result.
  List<Marker> allMarker = []; //List to store all marker
  static bool darkMode = false; //variable of type boolean to check if dark mode is true or false
  String availablity="All";
  String type="All";
  String feesRange = "All";
  String gender = "All";

  void filter(){
    filteredData = [];
    if(availablity == "All" &&  type == "All" && feesRange == "All" && gender == "All"){
      filterNotifier.value = result;
      return;
    }

    // result.forEach((element) {
    //   if(element.gender == gender && gender != "All"){
    //     if(element.price >= lower && element.price <= upper && feesRange != "All"){
    //       if(element.type == type && type != "All"){
    //        filteredData.add(element);
    //       }
    //     }else{
    //       if(element.type == type && type != "All"){
    //         filteredData.add(element);
    //       }
    //     }
    //   }else{
    //     if(element.price >= lower && element.price <= upper && feesRange != "All"){
    //       if(element.type == type && type != "All"){
    //         filteredData.add(element);
    //       }
    //     }
    //   }
    // });

    if(availablity != "All") {      // apply availability filter
      result.forEach((element) {
        if (element.gender == availablity) {
          filteredData.add(element);
        }
      });
    }
    if(type != "All") {             // apply type of doctor filter
      result.forEach((newElement) {
        bool exist = false;
        if (newElement.type == type) {
          filteredData.forEach((oldElement) {
            if(oldElement.name == newElement.name){
              exist = true;
            }
          });
          if(!exist){
            filteredData.add(newElement);
          }
        }
      });
    }
    if(feesRange != "All") {             // apply fee range filter
      int lower = int.parse(feesRange.substring(0,2));
      int upper = int.parse(feesRange.substring(4,6));
      print("$feesRange\n");
      result.forEach((newElement) {
        bool exist = false;
        if (newElement.price >= lower && newElement.price <= upper) {
          print(newElement.name);
          filteredData.forEach((oldElement) {
            if(oldElement.name == newElement.name){
              exist = true;
            }
          });
          if(!exist){
            filteredData.add(newElement);
          }
        }
      });
    }
    if(gender != "All") {             // apply gender filter
      result.forEach((newElement) {
        bool exist = false;
        if (newElement.gender == gender) {
          filteredData.forEach((oldElement) {
            if(oldElement.name == newElement.name){
              exist = true;
            }
          });
          if(!exist){
            filteredData.add(newElement);
          }
        }
      });
    }

    filterNotifier.value = filteredData;    //notify value listenable builder that value has changed
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //*************************TEST MARKER**********************************************
    allMarker.add(Marker(
        markerId: MarkerId("Marker 1"), //Marker name
        draggable: false, // Marker cannot be moved
        position: LatLng(40.7118, -74.0060) //Position of marker
        ));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 2"),
        draggable: false,
        position: LatLng(40.7180, -74.0060)));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 3"),
        draggable: false,
        position: LatLng(40.7155, -74.0020)));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 4"),
        draggable: false,
        position: LatLng(40.7110, -74.0040)));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 5"),
        draggable: false,
        position: LatLng(40.7130, -74.0060)));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 6"),
        draggable: false,
        position: LatLng(40.7150, -74.0070)));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 7"),
        draggable: false,
        position: LatLng(40.7140, -74.0080)));
    allMarker.add(Marker(
        markerId: MarkerId("Marker 8"),
        draggable: false,
        position: LatLng(40.7150, -74.0020)));
    //*************************TEST MARKER**********************************************
    //*************************TEST DATA**********************************************
    // DoctorData class is implemented in dummyData.dart. This class is used just to organise data
    result.add(DoctorData("Arivali Daruka", "Hematologists", "Specialty Healthcare","Female", 3.4, 300));
    result.add(DoctorData("Abjit Shinjinee", "Anesthesiologists", "Chiropractic Care","Male", 5.0, 400));
    result.add(DoctorData("Ritvik Magesh", "Anesthesiologists", "Trust Care Center","Male", 4.5, 230));
    result.add(DoctorData("Savar Phani", "Endocrinologists", "Hassle-free Health Care","Female", 3.8, 590));
    result.add(DoctorData("Sameer Vittal", "Dermatologists", "Medical Health Hub","Male", 2.9, 670));
    result.add(DoctorData("Devarsi Akshay Jayaram", "Dermatologists", "Allied Health Services","Female", 3.0, 800));
    result.add(DoctorData("Nilay Nivrutti Rakala", "Endocrinologists", "First Choice Health","Male", 4.8, 700));
    result.add(DoctorData("Titir Koduri", "Hematologists", "Healthy You Clinic","Female", 1.0, 580));
    //*************************TEST DATA**********************************************
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer:
      SafeArea(
        child: Drawer(    //Drawer that opens from right side.
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(     // Arrange widget in horizontal direction
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.filter),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Filters",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text("Dark Mode"),
                  Switch(     //toggle to switch on or off
                    value: darkMode,
                    onChanged: (bool) {
                      setState(() {
                        //if dark mode is enabled themeMode is changed to dark
                        //if dark mode is disabled themeMode is changed to light
                        if (darkMode) {
                          darkMode = false;
                          MyApp.themeNotifier.value = ThemeMode.light;
                        } else {
                          darkMode = true;
                          MyApp.themeNotifier.value = ThemeMode.dark;
                        }
                      });
                    },
                  ),
                ],
              ),
              Container(    // doctor Availability
                padding: EdgeInsets.all(20),   // apply padding only in mentioned direction
                child: DropdownButton(
                  value: availablity,   //initial value
                  isExpanded: true, // take the full space of container
                  items: [
                    //  this items will be there in the drop down menu
                    DropdownMenuItem(child: Text("Availability"), value: "All"),
                    DropdownMenuItem(
                        child: Text("Monday"),
                        value: "Monday"
                    ),
                    DropdownMenuItem(
                      child: Text("Tuesday"),
                      value: "Tuesday",
                    ),
                    DropdownMenuItem(
                      child: Text("Wednesday"),
                      value: "Wednesday",
                    ),
                    DropdownMenuItem(
                      child: Text("Thursday"),
                      value: "Thursday",
                    ),
                    DropdownMenuItem(
                      child: Text("Friday"),
                      value: "Friday",
                    ),
                    DropdownMenuItem(
                      child: Text("Saturday"),
                      value: "Saturday",
                    ),
                    DropdownMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: Text(
                              "Morning",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text(
                              "Afternoon",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text(
                              "Evening",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {

                            },
                          ),
                        ],
                      ),
                    )
                  ],
                  onChanged: (value) {
                    availablity=value;
                    print(value);
                  },
                ),
              ),
              Container(      // doctor type menu
                padding: EdgeInsets.all(20),
                child: DropdownButton(
                  value: type,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                        child: Text("Doctor Speciality"), value: "All"),
                    DropdownMenuItem(
                        child: Text("Hematologists"), value: "Hematologists"),
                    DropdownMenuItem(
                      child: Text("Anesthesiologists"),
                      value: "Anesthesiologists",
                    ),
                    DropdownMenuItem(
                      child: Text("Endocrinologists"),
                      value: "Endocrinologists",
                    ),
                    DropdownMenuItem(
                      child: Text("Dermatologists"),
                      value: "Dermatologists",
                    ),
                  ],
                  onChanged: (value) {
                    type=value;
                    filter();
                  },
                ),
              ),
              Container(      // doctor fees range menu
                padding: EdgeInsets.all(20),
                child: DropdownButton(
                  value: feesRange,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(child: Text("Fees"), value: "All"),
                    DropdownMenuItem(child: Text("150-300"), value: "150-300"),
                    DropdownMenuItem(
                      child: Text("300-750"),
                      value: "300-750",
                    ),
                    DropdownMenuItem(
                      child: Text("750+"),
                      value: "750+",
                    ),
                  ],
                  onChanged: (value) {
                    feesRange=value;
                    filter();
                  },
                ),
              ),
              Container(    // doctor gender menu
                padding: EdgeInsets.all(20),
                child: DropdownButton(
                  value: gender,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(child: Text("Gender"), value: "All"),
                    DropdownMenuItem(child: Text("Male"), value: "Male"),
                    DropdownMenuItem(
                      child: Text("Female"),
                      value: "Female",
                    ),
                  ],
                  onChanged: (value) {
                    gender=value;
                    filter();
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                //its is the initial position where map will point when app starts
                target: LatLng(40.7128,
                    -74.0060), // coordinates where the map should point when app starts
                zoom: 15 // initial zoom
                ),
            markers: Set.from(allMarker), // Custom marker set on the map
          ),
          Positioned(
            bottom: 10,
            left: 5,
            child: SizedBox(
              height: 300,
              width: 400,
              child: ValueListenableBuilder(      // to rebuild the list when user applies filter
                valueListenable: filterNotifier,   // this is used to check if value is changed or not
                builder: (context, result, _) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        // print(index);
                        return DoctorInfo(
                            // This Widget is implemented in doctorInfo.dart.
                            index+1,
                            result[index].name,
                            result[index].type,
                            result[index].address,
                            result[index].rating,
                            result[index].price);
                      });
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigation(), // This Widget is implemented in bottomNavigation.dart. Its is the bottom navigation
    );
  }
}
