import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/services/initialize_remote_config.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';

class DrawerHelpPage extends StatefulWidget {
  const DrawerHelpPage({Key? key}) : super(key: key);

  @override
  State<DrawerHelpPage> createState() => _DrawerHelpPageState();
}

var helpList = InitializeRemoteConfig.getHelpPageContent()[
    Get.deviceLocale!.countryCode == "tr" ? 0 : 1];
PageController _pageController = PageController();
int pageNumber = 0;
int selectedQuestion = 0;

class _DrawerHelpPageState extends State<DrawerHelpPage> {
  @override
  void initState() {
    InitializeRemoteConfig.init();
    InitializeRemoteConfig.remoteConfigInitialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text(Languages.of(context)!.drawer_help),
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                pageNumber == 1
                    ? _pageController.jumpToPage(0)
                    : Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios,color: white,)),

        ),
        body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              pageNumber = page;
            });
          },
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          title: Text(helpList["value"][index]["question"]),
                          onTap: () {
                            setState(() {
                              selectedQuestion=index;
                            });
                            _pageController.jumpToPage(1);
                          },
                        ),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: helpList["value"].length ?? 0)
                : ListTile(
                    title: Html(
                        data: helpList["value"][selectedQuestion]["answer"]),



                  );
          },
        ));
  }
}


