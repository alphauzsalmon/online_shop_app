import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_app/constants/colors.dart';
import 'package:online_shop_app/constants/dropdown_items.dart';
import 'package:online_shop_app/constants/typography.dart';
import 'package:online_shop_app/screens/main_page/dropdown_button_widget.dart';

class FilterOptionsWidget extends StatefulWidget {
  const FilterOptionsWidget({Key? key}) : super(key: key);

  @override
  State<FilterOptionsWidget> createState() => _FilterOptionsWidgetState();
}

class _FilterOptionsWidgetState extends State<FilterOptionsWidget> {
  late String brandValue;
  late String priceValue;
  late String sizeValue;

  @override
  void initState() {
    brandValue = brands.first;
    priceValue = prices.first;
    sizeValue = sizes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375.0.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 24.0.h),
          Padding(
              padding: EdgeInsets.only(left: 44.0.w, right: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      brandValue = brands.first;
                      priceValue = prices.first;
                      sizeValue = sizes.first;
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 37.0.h,
                      width: 37.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0.r),
                        color: boldColor,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                          'assets/icons/main_page/cancel.svg',
                          height: 10.0.h,
                          width: 11.0.w,
                          color: Colors.white),
                    ),
                  ),
                  Text('Filter options', style: markPro18and500(boldColor)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 37.0.h,
                      width: 86.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0.r),
                        color: lightColor,
                      ),
                      alignment: Alignment.center,
                      child: Text('Done', style: markPro18and500(boldColor)),
                    ),
                  ),
                ],
              )),
          SizedBox(height: 50.0.h),
          Padding(
            padding: EdgeInsets.only(left: 46.0.w),
            child: Text('Brand', style: markPro18and500(boldColor)),
          ),
          SizedBox(height: 12.0.h),
          Padding(
            padding: EdgeInsets.only(left: 46.0.w),
            child: DropDownButtonWidget(
              onChanged: (value) {
                setState(() {
                  brandValue = value!;
                });
                debugPrint(value);
              },
              value: brandValue,
              hinText: brandValue,
              items: brands
                  .map(
                    (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: markPro18and400(boldColor))),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 15.0.h),
          Padding(
            padding: EdgeInsets.only(left: 46.0.w),
            child: Text('Price', style: markPro18and500(boldColor)),
          ),
          SizedBox(height: 12.0.h),
          Padding(
            padding: EdgeInsets.only(left: 46.0.w),
            child: DropDownButtonWidget(
              onChanged: (value) {
                setState(() {
                  priceValue = value!;
                });
                debugPrint(value);
              },
              value: priceValue,
              hinText: priceValue,
              items: prices
                  .map(
                    (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: markPro18and400(boldColor))),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 15.0.h),
          Padding(
            padding: EdgeInsets.only(left: 46.0.w),
            child: Text('Size', style: markPro18and500(boldColor)),
          ),
          SizedBox(height: 12.0.h),
          Padding(
            padding: EdgeInsets.only(left: 46.0.w),
            child: DropDownButtonWidget(
              onChanged: (value) {
                setState(() {
                  sizeValue = value!;
                });
              },
              value: sizeValue,
              hinText: sizeValue,
              items: sizes
                  .map(
                    (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, style: markPro18and400(boldColor))),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
