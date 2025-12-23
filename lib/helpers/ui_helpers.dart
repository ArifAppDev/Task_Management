import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
final class UIHelper {
  UIHelper._();

  static double verticalSpacemediumvalue = 17.h;
  static double verticalspace16value = 16.h;
  static double varticalspacesmallvalue = 17.h;
  static double verticalspacesmallvalue = 6.h;
  static double horizontalspacemediumvalue = 13.h;
  static double verticalspace12value = 12.h;

  static double verticalspace20value = 20.h;
  static double horizontalspace20value = 20.w;
  static double horizontalspace16value = 16.w;
  static double horizontalspace12value = 12.w;

  static Widget verticalSpacemedium = SizedBox(
    height: verticalSpacemediumvalue,
  );
  static Widget verticalspacesmall = SizedBox(height: verticalspacesmallvalue);
  static Widget verticalspaverysmall = SizedBox(
    height: verticalspacesmallvalue,
  );
  static Widget howizontalspace = SizedBox(width: horizontalspacemediumvalue);
  static Widget verticalspace12 = SizedBox(height: verticalspace12value);
  static Widget verticalspace16 = SizedBox(height: verticalspace16value);

  static Widget verticalspace20 = SizedBox(height: verticalspace20value);
  static Widget horizontalspace20 = SizedBox(width: horizontalspace20value);
  static Widget horizontalspace16 = SizedBox(width: horizontalspace16value);
  static Widget horizontalspace12 = SizedBox(width: horizontalspace12value);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);

  static Widget customDivider() =>
      Container(height: 1.h, color: Colors.grey, width: double.infinity);

  //  SizedBox(
  //           width: MediaQuery.of(context).size.width,
  //           child: Divider(color: AppColor.cF2F2F2, thickness: 1.w),
  //         ),
  //         UIHelper.verticalspace20,
}
