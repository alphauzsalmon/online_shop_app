import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constants/colors.dart';
import 'package:online_shop_app/constants/typography.dart';

class HomeStoreWidget extends StatelessWidget {
  const HomeStoreWidget({
    Key? key,
    required this.imageUrl,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.isBuy,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String subtitle;
  final bool isNew;
  final bool isBuy;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0.h,
      margin: EdgeInsets.only(left: 17.0.w, right: 20.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0.r),
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            left: 23.0.w,
            top: 15.0.h,
            child: isNew
                ? Container(
                    height: 27.0.h,
                    width: 27.0.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: lightColor),
                    alignment: Alignment.center,
                    child: Text(
                      'New',
                      style: sFProDisplay10and700(Colors.white),
                    ),
                  )
                : const SizedBox(),
          ),
          Positioned(
            left: 23.0.w,
            top: 50.0.h,
            child: Text(title, style: sFProDisplay25and700(Colors.white)),
          ),
          Positioned(
            left: 23.0.w,
            top: 85.0.h,
            child: Text(subtitle, style: sFProDisplay11and400(Colors.white)),
          ),
          Positioned(
            left: 23.0.w,
            top: 104.0.h,
            child: isBuy
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: Size(98.0.w, 23.0.h),
                    ),
                    onPressed: () {},
                    child: Text('Buy now!',
                        style: sFProDisplay11and700(boldColor)))
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
