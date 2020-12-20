import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';

class CityForecast extends StatelessWidget {
  String city;
  String temp;
  String temp2;
  String weather;
  IconData icon;

  CityForecast({
    this.city,
    this.temp,
    this.temp2,
    this.weather,
    this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(icon, color: ConstantColors.primaryBlue,),
            Column(
              children: [
                Text(
                  "$city, Indonesia",
                  style: TextStyle(
                      color: ConstantColors.fontGrey,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      fontFamily: 'Ubuntu'
                  ),
                ),
                Text(
                  weather,
                  style: TextStyle(
                      color: ConstantColors.primaryBlue,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      fontFamily: 'Lato'
                  ),
                ),
              ],
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
                              fontFamily: 'Ubuntu',
                              decoration: TextDecoration.none,
                              fontSize: 13
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
