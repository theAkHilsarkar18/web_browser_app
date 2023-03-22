import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:web_browser_app/screens/homescreen/provider/homeprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homeprovider? homeproviderTrue;
  Homeprovider? homeproviderFalse;
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    homeproviderFalse = Provider.of(context, listen: false);
    homeproviderTrue = Provider.of(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10,),
                   InkWell(onTap: () {
                     homeproviderTrue!.inAppWebViewController!.goBack();
                   },child: Icon(Icons.arrow_back)),
                   SizedBox(width: 10,),
                   InkWell(onTap: () {
                     homeproviderTrue!.inAppWebViewController!.reload();
                   },child: Icon(Icons.refresh)),
                    SizedBox(width: 10,),
                   InkWell(onTap: () {
                     homeproviderTrue!.inAppWebViewController!.goForward();
                   },child: Icon(Icons.arrow_forward_outlined)),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.topCenter,
                    child: TextField(
                      controller: txtSearch,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          onPressed: () {
                            String newLink = txtSearch.text;
                            homeproviderTrue!.inAppWebViewController?.loadUrl(
                              urlRequest: URLRequest(
                                url: Uri.parse(
                                  "https://www.google.com/search?q=$newLink",
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            LinearProgressIndicator(value: homeproviderTrue!.webProgresser),
            Expanded(
              child: InAppWebView(
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://www.google.com/")),
                onWebViewCreated: (controller) =>
                    homeproviderTrue!.inAppWebViewController = controller,
                onLoadError: (controller, url, code, message) =>
                homeproviderTrue!.inAppWebViewController = controller,
                onLoadStart: (controller, url) =>
                homeproviderTrue!.inAppWebViewController = controller,
                onLoadStop: (controller, url) =>
                homeproviderTrue!.inAppWebViewController = controller,
                onProgressChanged: (controller, progress) =>
                    homeproviderFalse!.changeProgress(progress / 100),
                onCloseWindow: (controller) => homeproviderTrue!.inAppWebViewController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
