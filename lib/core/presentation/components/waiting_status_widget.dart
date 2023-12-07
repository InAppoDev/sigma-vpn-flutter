import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class WaitingStatusWidget extends StatelessWidget {
  const WaitingStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenHeightRatio(14),
        ),
        CupertinoButton(
            child: SvgPicture.asset(
              openButtonSVG,
              height: screenHeightRatio(196),
              width: screenWidthRatio(196),
            ),
            onPressed: () {}),
        SizedBox(
          height: screenHeightRatio(73),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              disconnectSVG,
              height: screenHeightRatio(24),
              width: screenWidthRatio(21),
            ),
            SizedBox(
              width: screenWidthRatio(8),
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
