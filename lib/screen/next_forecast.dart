import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/widget/constant.dart';
import 'package:weather_app/widget/forecast_daylist.dart';

class NextForecast extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        accentColor: ConstantColors.blueAccent.withOpacity(0.8),
        textTheme: TextTheme(
            body1:
            TextStyle(color: ConstantColors.darkBlue, fontSize: 16)),
        iconTheme: IconThemeData(color: ConstantColors.primaryBlue),
      ),
      home: Scaffold(
        appBar: appBar(context),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ConstantColors.bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerTittle(BuildContext),
              detailTomorrow(context),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    DailyForecast(
                      day: "Jumat",
                      temp: "30",
                      temp2: "32",
                      rain: "32",
                      humidity: "70",
                      icon: FontAwesomeIcons.solidSun,
                    ),
                    DailyForecast(
                      day: "Sabtu",
                      temp: "29",
                      temp2: "30",
                      rain: "63",
                      humidity: "78",
                      icon: FontAwesomeIcons.cloudSunRain,
                    ),
                    DailyForecast(
                      day: "Minggu",
                      temp: "28",
                      temp2: "29",
                      rain: "66",
                      humidity: "75",
                      icon: FontAwesomeIcons.cloudShowersHeavy,
                    ),
                    DailyForecast(
                      day: "Senin",
                      temp: "29",
                      temp2: "30",
                      rain: "62",
                      humidity: "74",
                      icon: FontAwesomeIcons.cloudShowersHeavy,
                    ),
                    DailyForecast(
                      day: "Selasa",
                      temp: "28",
                      temp2: "29",
                      rain: "43",
                      humidity: "77",
                      icon: FontAwesomeIcons.cloud,
                    ),
                    DailyForecast(
                      day: "Rabu",
                      temp: "29",
                      temp2: "30",
                      rain: "55",
                      humidity: "78",
                      icon: FontAwesomeIcons.cloud,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget headerTittle(BuildContext) => Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "7 Hari ",
              style: TextStyle(
                color: ConstantColors.fontGrey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              )
          ),
          TextSpan(
              text: "berikutnya",
              style: TextStyle(
                color: ConstantColors.fontGrey,
                fontSize: 22,
                fontFamily: 'Ubuntu',
              )
          ),
        ],
      ),
    ),
  );


  Widget detailTomorrow(BuildContext context) => Container(
    height: 120,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
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
                          text: "Kamis ",
                          style: TextStyle(
                              color: ConstantColors.fontGrey,
                              fontFamily: 'Ubuntu',
                              fontSize: 21
                          )
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: FaIcon(
                              FontAwesomeIcons.cloud,
                              size: 16,
                          ),
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
                                  color: ConstantColors.fontGrey.withOpacity(0.6),
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
                      color: ConstantColors.fontGrey.withOpacity(0.6),
                      fontFamily: 'Ubuntu'
                  ),),
                  Text("20 km", style: TextStyle(
                      color: ConstantColors.fontGrey.withOpacity(0.6),
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
                      color: ConstantColors.fontGrey.withOpacity(0.6),
                      fontFamily: 'Ubuntu'
                  ),),
                  Text("2", style: TextStyle(
                      color: ConstantColors.fontGrey.withOpacity(0.6),
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


  Widget appBar(BuildContext context) => AppBar(
    title: Text(
      'Ramalan Cuaca',
      style: TextStyle(
          color: ConstantColors.fontGrey,
          fontFamily: 'Lato'
      ),
    ),
    elevation: 0,
    leadingWidth: 30,
    leading: IconButton(
      icon: FaIcon(
        FontAwesomeIcons.angleLeft,
        size: 25,
        color: ConstantColors.fontGrey,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    backgroundColor: ConstantColors.bgColor,
  );
}
