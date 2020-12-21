import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/widget/constant.dart';
import 'package:weather_app/widget/forecast_city.dart';
import 'package:weather_app/widget/forecast_hourly.dart';

import 'next_forecast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isToday = true;
  int currentTime = int.parse(DateTime.now().toString().substring(11,13));



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("@@@*** now " + currentTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        accentColor: ConstantColors.blueAccent.withOpacity(0.8),
        textTheme: TextTheme(
            body1:
            TextStyle(color: ConstantColors.darkBlue, fontSize: 16)),
        iconTheme: IconThemeData(color: ConstantColors.fontGrey),
      ),
      home: Scaffold(
          body: Container(
            color: ConstantColors.bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                todayWeather(context),
                imageWeather(context),
                detailTemp(context)
              ],
            ),
          )
      ),
    );
  }

  Widget todayWeather(BuildContext context) => Container(
    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hujan", style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 27,
            ),),
            SizedBox(height: 10),
            Text("Rab, 09 Des 2020"),
            GestureDetector(
              onTap: () => showCupertinoModalBottomSheet(
                  context: context,
                  elevation: 5000,
                  barrierColor: ConstantColors.darkBlue.withOpacity(0.5),
                  builder: (context) => BuildLocation(),
                ),
              child: Row(
                children: [
                  Text("Subang, Indonesia "),
                  FaIcon(FontAwesomeIcons.pencilAlt, size: 12,)
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("29",
              style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'Ubuntu',
                  color: ConstantColors.fontGrey,
                  fontWeight: FontWeight.w600
              ),),
            Text('\u00b0C',
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  color: ConstantColors.fontGrey
              ),)
          ],
        )
      ],
    ),
  );


  Widget imageWeather(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: size.width > 600 && size.height > 700
          ? EdgeInsets.symmetric(vertical: 100) : EdgeInsets.symmetric(vertical: 0),
      child: Image.asset('assets/images/rainy.png'),
    );
  }

  Widget detailTemp(BuildContext context) {

    Widget yesterdayButton = GestureDetector(
      onTap: () {
        setState(() {
          isToday = false;
        });
      },
      child: Container(
        height: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Kemarin',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                  color: !isToday
                      ? ConstantColors.primaryBlue
                      : ConstantColors.darkBlue
              ),
            ),
            !isToday ?
            Icon(
                Icons.fiber_manual_record,
                color: ConstantColors.primaryBlue,
                size: 12) : SizedBox(),

          ],
        ),
      ),
    );

    Widget todayButton = GestureDetector(
      onTap: () {
        setState(() {
          isToday = true;
        });
      },
      child: Container(
        height: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hari ini',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                  color: isToday
                      ? ConstantColors.primaryBlue
                      : ConstantColors.darkBlue
              ),
            ),
            isToday ?
            Icon(
                Icons.fiber_manual_record,
                color: ConstantColors.primaryBlue,
                size: 12) : SizedBox(),
          ],
        ),
      ),
    );

    Widget nextButton(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FlatButton(
          color: ConstantColors.fontGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          textColor: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "7 Hari lagi",
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                child: FaIcon(FontAwesomeIcons.angleRight, size: 21,),
                padding: EdgeInsets.only(left: 5),
              )
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: NextForecast(),
                  inheritTheme: true,
                  ctx: context),
            );
          },
        )
      ],
    );


    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
//                height: 50,
              padding: EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  yesterdayButton,
                  todayButton,
                  nextButton(context),
                ],
              ),
            ),
            Container(
              height: 125,
              child: ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  HourlyForecast(
                    icon: FontAwesomeIcons.cloudMoon,
                    hour: "00:00",
                    isToday: isToday && currentTime >= 0 && currentTime <3 ? true : false,
                    temp: "26",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.cloud,
                    hour: "03:00",
                    isToday: isToday && currentTime >= 3 && currentTime <6 ? true : false,
                    temp: "27",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.cloudSun,
                    hour: "06:00",
                    isToday: isToday && currentTime >= 6 && currentTime <9 ? true : false,
                    temp: "29",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.cloud,
                    hour: "09:00",
                    isToday: isToday && currentTime >= 9 && currentTime <12 ? true : false,
                    temp: "29",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.cloudShowersHeavy,
                    hour: "12:00",
                    isToday: isToday && currentTime >= 12 && currentTime <15 ? true : false,
                    temp: "28",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.solidSun,
                    hour: "15:00",
                    isToday: isToday && currentTime >= 15 && currentTime <18 ? true : false,
                    temp: "28",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.cloud,
                    hour: "18:00",
                    isToday: isToday && currentTime >= 18 && currentTime <21 ? true : false,
                    temp: "27",
                  ),
                  HourlyForecast(
                    icon: FontAwesomeIcons.solidMoon,
                    hour: "21:00",
                    isToday: isToday && currentTime >= 21 && currentTime <=23 ? true : false,
                    temp: "27",
                  )
                ],
              ),
            ),
            detailToday(context)
          ],
        ),
      ),
    );
  }

  Widget detailToday(BuildContext context) => Container(
    height: 100,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        color: ConstantColors.bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ConstantColors.fontGrey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: isToday ? "Rabu " : "Selasa ",
                          style: TextStyle(
                              color: ConstantColors.primaryBlue,
                              fontFamily: 'Ubuntu',
                              fontSize: 21
                          )
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: FaIcon(FontAwesomeIcons.cloudShowersHeavy, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "29\u00b0 ",
                          style: TextStyle(
                              color: ConstantColors.fontGrey,
                              fontFamily: 'Ubuntu',
                              fontSize: 21
                          )
                      ),
                      WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "30\u00b0",
                              style: TextStyle(
                                  color: ConstantColors.primaryBlue,
                                  fontFamily: 'Ubuntu'
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Angin"),
                  Text("Visibiltas")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("12 m/h", style: TextStyle(
                      color: ConstantColors.primaryBlue,
                      fontFamily: 'Ubuntu'
                  ),),
                  Text("20 km", style: TextStyle(
                      color: ConstantColors.primaryBlue,
                      fontFamily: 'Ubuntu'
                  ),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Kelembaban"),
                  Text("UV")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("55%", style: TextStyle(
                      color: ConstantColors.primaryBlue,
                      fontFamily: 'Ubuntu'
                  ),),
                  Text("2", style: TextStyle(
                      color: ConstantColors.primaryBlue,
                      fontFamily: 'Ubuntu'
                  ),),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}


class BuildLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            SizedBox(
              width: 50,
              child: Divider(
                thickness: 3,
                color: ConstantColors.darkBlue.withOpacity(0.2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(FontAwesomeIcons.mapPin, color: ConstantColors.primaryBlue,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Gunakan lokasi saat ini :",
                      style: TextStyle(
                          color: ConstantColors.fontGrey,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontFamily: 'Lato'
                      ),
                    ),
                    Text(
                      "Subang, Indonesia",
                      style: TextStyle(
                          color: ConstantColors.fontGrey,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          fontFamily: 'Ubuntu'
                      ),
                    ),
                  ],
                ),
                FlatButton(
                  color: ConstantColors.fontGrey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Kalibrasi",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        child: FaIcon(Icons.gps_fixed, size: 19,),
                        padding: EdgeInsets.only(left: 5),
                      )
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 2.0,
              color: ConstantColors.primaryBlue.withOpacity(0.5),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [
                  CityForecast(
                    icon: FontAwesomeIcons.cloudSun,
                    city: "Jakarta",
                    weather: "Cerah Berawan",
                    temp: "30",
                    temp2: "31",
                  ),
                  CityForecast(
                    icon: FontAwesomeIcons.cloudShowersHeavy,
                    city: "Bandung",
                    weather: "Hujan",
                    temp: "27",
                    temp2: "28",
                  ),
                  CityForecast(
                    icon: FontAwesomeIcons.cloudSun,
                    city: "Semarang",
                    weather: "Cerah Berawan",
                    temp: "31",
                    temp2: "32",
                  ),
                  CityForecast(
                    icon: FontAwesomeIcons.solidSun,
                    city: "Surabaya",
                    weather: "Cerah",
                    temp: "31",
                    temp2: "32",
                  ),
                  CityForecast(
                    icon: FontAwesomeIcons.cloud,
                    city: "Makasar",
                    weather: "Berawan",
                    temp: "29",
                    temp2: "31",
                  ),
                  CityForecast(
                    icon: FontAwesomeIcons.cloudSun,
                    city: "Palembang",
                    weather: "Berawan",
                    temp: "28",
                    temp2: "29",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



