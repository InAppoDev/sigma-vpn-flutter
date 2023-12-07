import 'package:flutter/material.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  const NavigationItem(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left:44 ),
      style: ListTileStyle.list,
      leading: icon,
      title: Text(title, style: wMediumS16White),
      onTap: onTap,
    );
  }
}
