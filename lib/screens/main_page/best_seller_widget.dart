import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constants/colors.dart';
import 'package:online_shop_app/constants/typography.dart';

class BestSellerWidget extends StatelessWidget {
  final String imageUrl;
  final bool isFavorites;
  final int price;
  final int discountPrice;
  final String title;
  final VoidCallback onPressedFavorite;
  final VoidCallback onPressed;
  const BestSellerWidget({
    Key? key,
    required this.imageUrl,
    required this.isFavorites,
    required this.price,
    required this.discountPrice,
    required this.title,
    required this.onPressedFavorite,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0.w, bottom: 13.0.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 227.0.h,
          width: 181.0.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 5.0.h,
                  child: Container(
                    height: 168.0.h,
                    width: 181.0.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(imageUrl))),
                  )),
              Positioned(
                  right: 12.0.w,
                  top: 11.0.h,
                  child: GestureDetector(
                    onTap: onPressedFavorite,
                    child: Container(
                      height: 25.0.h,
                      width: 25.0.w,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      alignment: Alignment.center,
                      child: isFavorites
                          ? Icon(Icons.favorite, color: lightColor, size: 20.0.sp)
                          : Icon(Icons.favorite_border_outlined,
                              color: lightColor, size: 20.0.sp),
                    ),
                  )),
              Positioned(
                  left: 21.0.w,
                  top: 175.0.h,
                  child: Row(
                    children: [
                      Text('\$$price', style: markPro16and700(boldColor)),
                      Text('\$$discountPrice',
                          style: discountStyle(discountPriceColor))
                    ],
                  )),
              Positioned(
                left: 21.0.w,
                top: 199.0.h,
                child: Text(title, style: markPro10and400(boldColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
