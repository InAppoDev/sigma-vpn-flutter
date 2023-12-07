import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key,
    required this.engine, required this.status,
  }) : super(key: key);

  final OpenVPN engine;
  final String status;

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
              SizedBox(
                width: screenWidthRatio(5),
              ),
              Flexible (
                child: Text(
                  status,
                  style: wRegularS15White,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeightRatio(2),),
        CupertinoButton(
            child: SvgPicture.asset(
              openButtonDeactivateSVG,
              height: screenHeightRatio(196),
              width: screenWidthRatio(196),
            ),
            onPressed: () {engine.disconnect();}),
        SizedBox(
          height: screenHeightRatio(73),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              color: circularIndicatorColor,
            ),
            SizedBox(
              width: screenWidthRatio(8),
            ),
            Text(
              status==Languages.of(context)!.home_disconnecting?Languages.of(context)!.home_disconnecting:
              Languages.of(context)!.home_connecting,
              style: wRegularS17White,
            )
          ],
        ),
      ],
    );
  }
}

