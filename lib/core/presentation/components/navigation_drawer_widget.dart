import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/presentation/components/navigation_drawer_item_widget.dart';
import 'package:sigmavpnflutter/core/presentation/pages/about_us_page.dart';
import 'package:sigmavpnflutter/core/presentation/pages/drawer_help_page.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';
import 'package:share_plus/share_plus.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
        child: Material(
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeightRatio(36),
              ),
              SvgPicture.asset(
                drawerLogoSVG,
                height: screenHeightRatio(90),
                width: 77,
              ),
              SizedBox(
                height: screenHeightRatio(15),
              ),
              Text(
                "SIGMA VPN",
                style: wRegularS24White,
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
                color: white,
              ),
              SizedBox(
                height: screenHeightRatio(30),
              ),
              NavigationItem(
                  title: Languages.of(context)!.drawer_help,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DrawerHelpPage()),
                    );
                  },
                  icon: SvgPicture.asset(
                    drawerHelpSVG,
                    height: 24,
                    width: 24,
                  )),
              const Divider(
                indent: 40,
                color: white,
              ),
              // NavigationItem(
              //     title: Languages.of(context)!.drawer_rate,
              //     onTap: (){},
              //     icon: SvgPicture.asset(
              //       drawerRateSVG,
              //       height: 24,
              //       width: 24,
              //     )),
              // const Divider(
              //   indent: 40,
              //
              //   color: white,
              // ),
              NavigationItem(
                  title: Languages.of(context)!.drawer_share,
                  onTap: () async {
                    await Share.share(Languages.of(context)!.share_app);
                  },
                  icon: SvgPicture.asset(
                    drawerShareSVG,
                    height: 24,
                    width: 24,
                  )),
              const Divider(
                indent: 40,
                color: white,
              ),
              NavigationItem(
                  title: Languages.of(context)!.drawer_about,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUsPage()),
                    );
                  },
                  icon: SvgPicture.asset(
                    drawerAboutSVG,
                    height: 24,
                    width: 24,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
