import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sigmavpnflutter/core/localization/language/languages.dart';
import 'package:sigmavpnflutter/core/services/unit_converter.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/svg_paths.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class DownloadAndUploadRow extends StatelessWidget
{

  final VpnStatus? status;
  const DownloadAndUploadRow({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidthRatio(320, context),
      height: screenHeightRatio(53, context),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  downloadSVG,
                  height: screenHeightRatio(24, context),
                  width: screenWidthRatio(24, context),
                ),
                SizedBox(
                  width: screenWidthRatio(16, context),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Languages.of(context)!.home_download,
                      style: wRegularS14White,
                    ),
                    Text(
                      UnitConverter().unitConverter(
                          double.parse(status!.byteIn.toString())),
                      style: wBoldS16Primary,
                    ),
                  ],
                ),
              ],
            ),
            VerticalDivider(
              color: Colors.white,
              endIndent: screenHeightRatio(10, context),
              indent: screenHeightRatio(10, context),
              width: screenWidthRatio(4, context),
              thickness: screenWidthRatio(1, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  uploadSVG,
                  height: screenHeightRatio(24, context),
                  width: screenWidthRatio(24, context),
                ),
                SizedBox(
                  width: screenWidthRatio(16, context),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Languages.of(context)!.home_upload,
                      style: wRegularS14White,
                    ),
                    Text(
                      UnitConverter().unitConverter(
                          double.parse(status!.byteOut.toString())),
                      style: wBoldS16Primary,
                    ),
                  ],
                ),
              ],
            ),
          ]),
    );
  }
}