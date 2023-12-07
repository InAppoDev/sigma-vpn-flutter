import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class ConnectedStatusWidget extends StatefulWidget {
  final VoidCallback? onPressed;

  const ConnectedStatusWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  State<ConnectedStatusWidget> createState() => _ConnectedStatusWidgetState();
}

class _ConnectedStatusWidgetState extends State<ConnectedStatusWidget> {
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
            onPressed: widget.onPressed),
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
              style: wRegularS16White,
            )
          ],
        ),
      ],
    );
  }
}
