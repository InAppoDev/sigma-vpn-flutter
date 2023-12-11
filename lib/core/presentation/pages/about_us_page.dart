import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/services/initialize_remote_config.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

var terms = InitializeRemoteConfig.getTermsContent()[
    Get.deviceLocale!.countryCode == "tr" ? 0 : 1];
var privacy = InitializeRemoteConfig.getPrivacyPolicyContent()[
    Get.deviceLocale!.countryCode == "tr" ? 0 : 1];

PageController _pageController = PageController();
int pageNumber = 0;
int selectedQuestion = 0;

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    InitializeRemoteConfig.init();
    InitializeRemoteConfig.remoteConfigInitialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (canPop) async {
        setState(() {
          pageNumber = 0;
        });
        _pageController.jumpToPage(0);
      },
      child: Scaffold(
          backgroundColor: pageNumber == 0 ? secondaryColor : white,
          appBar: AppBar(
            backgroundColor: secondaryColor,
            title: Text(Languages.of(context)!.drawer_about),
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  pageNumber == 1
                      ? _pageController.jumpToPage(0)
                      : Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: white,
                )),
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
                  ? Column(
                      children: [
                        SizedBox(
                          height: screenHeightRatio(36, context),
                        ),
                        Image.asset(
                          "assets/ic_about_logo.png",
                          height: 150,
                          width: 150,
                        ),
                        SizedBox(
                          height: screenHeightRatio(8, context),
                        ),
                        Text(
                          "SIGMA VPN",
                          style: wRegularS24White,
                        ),
                        SizedBox(
                          height: screenHeightRatio(16, context),
                        ),
                        const Divider(
                          color: white,
                          thickness: 0.3,
                        ),
                        ListTile(
                            title: Text(Languages.of(context)!.drawer_terms,
                                style: wRegularS14White),
                            onTap: () {
                              _pageController.jumpToPage(1);
                              selectedQuestion = 0;
                              setState(() {});
                            },
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: white)),
                        const Divider(
                          color: white,
                          thickness: 0.3,
                        ),
                        ListTile(
                            title: Text(Languages.of(context)!.drawer_privacy,
                                style: wRegularS14White),
                            onTap: () {
                              _pageController.jumpToPage(1);
                              selectedQuestion = 1;
                              setState(() {});
                            },
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: white,
                            )),
                        const Divider(
                          color: white,
                          thickness: 0.3,
                        ),
                      ],
                    )
                  : ListTile(
                      title: ListView(
                        children: [
                          Html(
                              data: selectedQuestion == 0
                                  ? terms["value"]
                                  : privacy["value"]),
                        ],
                      ),
                    );
            },
          )),
    );
  }
}
