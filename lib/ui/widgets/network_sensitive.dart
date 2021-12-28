import 'package:EOR/enums/connectivity_status.dart';
import 'package:EOR/ui/widgets/connection_faild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget? child;
  final double opacity;
  final int img_type;

  NetworkSensitive({
    this.child,
    this.opacity = 0.5,
    this.img_type = 1,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child!;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return child!;
    }

    return ConnectionFaildScreen();
  }
}