import 'package:flutter/material.dart';
class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  ResponsiveLayoutScreen({Key? key,required this.mobileScreenLayout,required this.webScreenLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context,constraits){
        if(constraits.maxWidth<=768){
        return mobileScreenLayout;
        }
        return webScreenLayout;
        },
    );

  }
}
