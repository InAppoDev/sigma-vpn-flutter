import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sigmavpnflutter/core/data/local_storage.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class VpnConnectedStatusWidget extends StatelessWidget {
  const VpnConnectedStatusWidget({
    Key? key,
    required this.serverName,
    required this.engine,
  }) : super(key: key);

  final String serverName;
  final OpenVPN engine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                pinSVG,
                height: screenHeightRatio(14),
                width: screenWidthRatio(10),
              ),
              Flexible(
                child: Text(
                    Languages.of(context)!.home_connected_server.replaceAll(
                        "{0}",
                        serverName == ""
                            ? UserPreferences.getServerName()
                            : serverName),
                    style: wRegularS14White,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textWidthBasis: TextWidthBasis.parent),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenHeightRatio(18),
        ),
        SvgPicture.asset(
          connected2SVG,
          height: screenHeightRatio(190),
          width: screenWidthRatio(
            152,
          ),
        ),
        SizedBox(
          height: screenHeightRatio(34),
        ),
        SizedBox(
            height: screenHeightRatio(24),
            width: screenWidthRatio(110),
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: Text(
                Languages.of(context)!.home_disconnect,
                style: wMediumS13Black,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      // <-- SEE HERE
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset(
                              disconnectModalSVG,
                              height: screenHeightRatio(24),
                              width: screenWidthRatio(24),
                            ),
                            title: Text(Languages.of(context)!.home_disconnect),
                            onTap: () {
                              Navigator.pop(context);
                              engine.disconnect();
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(
                              cancelSVG,
                              height: screenHeightRatio(24),
                              width: screenWidthRatio(24),
                            ),
                            title: Text(Languages.of(context)!.general_cancel),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: screenHeightRatio(8),
                          )
                        ],
                      );
                    });
              },
              color: gold,
            )),
        SizedBox(
          height: screenHeightRatio(35),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              connectedSVG,
              height: screenHeightRatio(24),
              width: screenWidthRatio(21),
            ),
            SizedBox(
              width: screenWidthRatio(8),
            ),
            Text(
              Languages.of(context)!.home_connected,
              style: wRegularS17White,
            )
          ],
        ),
      ],
    );
  }
}
