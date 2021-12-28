import 'package:EOR/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

const double toolbarHeight = 80.0;

class WatcherToolbar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  const WatcherToolbar({required this.title, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: toolbarHeight,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          showBackButton
              ? GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.centerRight,
                width: 50,
                child: Icon(Icons.chevron_right,
                    size: 30, color: Colors.white)),
          )
              : Container(),
          Expanded(
            child: Text(title,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}