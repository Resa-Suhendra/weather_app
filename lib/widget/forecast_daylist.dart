import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';


class DailyForecast extends StatelessWidget {
  String day;
  String temp;
  String temp2;
  String rain;
  String humidity;
  IconData icon;

  DailyForecast({
    this.day,
    this.temp,
    this.temp2,
    this.rain,
    this.humidity,
    this.icon
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(icon),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  day
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "$temp\u00b0 ",
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
                            "$temp2\u00b0",
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
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "Hujan"
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "$rain%",
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "Kelembaban"
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "$humidity%",
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
          )
        ],
      ),
    );

  }
}
