import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';

class HourlyForecast extends StatelessWidget {

  String hour;
  String temp;
  IconData icon;
  bool isToday;

  HourlyForecast({
    this.hour,
    this.temp,
    this.icon,
    this.isToday
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      margin: EdgeInsets.only(
          right: 7.5,
          left: 7.5,
          bottom: isToday ? 15 : 5,
          top: isToday ? 5 : 15),
      decoration: BoxDecoration(
          boxShadow: isToday ? [
            BoxShadow(
              color: ConstantColors.darkBlue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ] : [],
          color: isToday ? ConstantColors.darkBlue : Colors.white,
          border: Border.all(color: ConstantColors.darkBlue),
          borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hour,
              style: TextStyle(
                  fontSize: 10,
                  color: isToday ? Colors.white : ConstantColors.fontGrey
              ),
            ),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: isToday ? ConstantColors.fontGrey : ConstantColors.bgColor,
                    shape: BoxShape.circle
                ),
                child: FaIcon(
                    icon,
                    color: isToday ? Colors.white : ConstantColors.primaryBlue
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(temp,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Ubuntu',
                      color: isToday ? Colors.white : ConstantColors.fontGrey,
                      fontWeight: FontWeight.w600
                  ),),
                Text('\u2103',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isToday ? Colors.white : ConstantColors.fontGrey
                  ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

