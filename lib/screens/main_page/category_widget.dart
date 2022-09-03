import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_app/constants/colors.dart';
import 'package:online_shop_app/constants/typography.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.logo,
    required this.title,
    required this.hasPressed,
    required this.onPressed,
  }) : super(key: key);
  final String logo;
  final String title;
  final bool hasPressed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0.w),
      child: SizedBox(
        child: Column(
          children: [
            GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 71.0.h,
                width: 71.0.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasPressed ? lightColor : Colors.white,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(logo,
                    color: hasPressed ? Colors.white : disableColor),
              ),
            ),
            SizedBox(height: 7.0.h),
            Text(title, style: markPro12and500(hasPressed ? lightColor : boldColor)),
          ],
        ),
      ),
    );
  }
}
