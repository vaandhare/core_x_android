import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/processor.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Processor',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/graphic_card.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Graphic Card',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/motherboard.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Motherboard',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/ram.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Ram',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/ssd.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Storage-SSD',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/hdd.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Storage-HDD',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/smps.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'SMPS',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/cabinet.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Cabinet',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/cards.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Cards',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/fan.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Fans',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
                Divider(),
                ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/others.svg",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    'Others',
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.0,
                    ),
                  ),
                  trailing: Icon(Icons.navigate_next),
                ),
              ],
            )
        )
    );
  }
}
