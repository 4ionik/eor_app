import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectionFaildScreen extends StatelessWidget {

  final int img_type;
  String img_name = "assets/10_Connection Lost.png";

  ConnectionFaildScreen({
    this.img_type = 1,
  });

  @override
  Widget build(BuildContext context) {
    if(img_type == 2){
      img_name = "assets/2_404 Error.png";
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            img_name,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child: FlatButton(
                color: Color(0xFF68C581),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(
                  "Salir".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}