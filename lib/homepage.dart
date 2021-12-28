import 'package:EOR/ui/widgets/connection_faild.dart';
import 'package:EOR/ui/widgets/network_sensitive.dart';
import 'package:EOR/ui/widgets/watcher_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:EOR/ui/shared/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WebViewController? _webViewController;

  String _url = "https://appmovilzh.enteoperador.org/eor_admin/index.php/home";
  int checkInt = 0;
  int _stackToView = 1;
  int _isError = 0;

  Future<bool> _onWillPop(BuildContext context) async {
    if (await _webViewController!.canGoBack()) {
      _webViewController!.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                if (_webViewController != null ){
                  _webViewController?.reload();
                }
              },
            ),
          ],
          title: Image.asset('assets/icon.png', fit: BoxFit.contain, height: 42,),
        ),
        body: IndexedStack(
          index: _stackToView,
          children: [

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: NetworkSensitive(
                child: WebView(
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  initialUrl: _url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebResourceError: (WebResourceError webviewerrr) {
                    // print("Handle your Error Page here" + webviewerrr.errorCode.toString());
                    setState(() {
                      _stackToView = 2;
                      _isError = 1;
                    });
                  },
                  onPageFinished: (String url) {
                    // print('Page finished loading:');
                    if(_isError == 1){
                      setState(() {
                        _stackToView = 2;
                      });
                    }else{
                      setState(() {
                        _stackToView = 0;
                      });
                    }

                  },

                ),
              ), //child
            ),

            Container(child: Center(child: CircularProgressIndicator())),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ConnectionFaildScreen(), //child
            ),

          ],
        ),
      ),
      onWillPop: () => _onWillPop(context),
    );

  }

}

