import 'package:flutter/material.dart';
import 'package:online_shop_app/constants/colors.dart';

class CircularIndicatorWidget extends StatelessWidget {
  const CircularIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(
          child:
              CircularProgressIndicator.adaptive(backgroundColor: boldColor)),
    );
  }
}
