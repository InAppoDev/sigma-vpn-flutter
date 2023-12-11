import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class ErrorStatusWidget extends StatelessWidget {
  const ErrorStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SvgPicture.asset(
              pinSVG,
              height: screenHeightRatio(14, context),
              width: screenWidthRatio(10, context),
            ),
            SizedBox(
              height: screenHeightRatio(5, context),
            ),
            Text(
              "IP: İstanbul(Turkey)",
              style: wRegularS15White,
            ),
          ],
        ),
        SizedBox(
          height: screenHeightRatio(73, context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              disconnectSVG,
              height: screenHeightRatio(24, context),
              width: screenWidthRatio(21, context),
            ),
            SizedBox(
              width: screenWidthRatio(8, context),
            ),
            Text(
              Languages.of(context)!.home_disconnected,
              style: wRegularS17White,
            )
          ],
        ),
      ],
    );
  }
}

