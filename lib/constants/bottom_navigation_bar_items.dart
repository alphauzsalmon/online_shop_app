import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_app/constants/typography.dart';

List<Widget> items = [
  Row(
    children: [
      Container(
        height: 8.0.h,
        width: 8.0.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(width: 7.0.w),
      Text(
        "Explorer",
        style: markPro15and700(Colors.white),
      )
    ],
  ),
  SvgPicture.asset(
    'assets/icons/home_page/cart.svg',
    height: 18.0.h,
    width: 17.54.w,
  ),
  SvgPicture.asset(
    'assets/icons/home_page/heart.svg',
    height: 17.0.h,
    width: 19.0.w,
  ),
  SvgPicture.asset(
    'assets/icons/home_page/person.svg',
    height: 17.57.h,
    width: 17.01.w,
  )
];
