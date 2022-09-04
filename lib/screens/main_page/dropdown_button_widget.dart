import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constants/callbacks.dart';
import 'package:online_shop_app/constants/colors.dart';
import '../../constants/typography.dart';

class DropDownButtonWidget extends StatelessWidget {
  final VoidCallbackString onChanged;
  final List<DropdownMenuItem<String?>>? items;
  final String? value;
  final String hinText;
  const DropDownButtonWidget({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.value,
    required this.hinText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      items: items,
      onChanged: onChanged,
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down_sharp, color: disableColor),
      hint: Text(hinText, style: markPro18and400(boldColor)),
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: 337.0.w, maxHeight: 37.0.h),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: dropdownBorderColor, width: 1.0.sp),
          borderRadius: BorderRadius.circular(5.0.r),
        )
      ),
    );
  }
}
