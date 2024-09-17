import 'package:flutter/material.dart';

extension NumberExtension on double {
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get topPadding => EdgeInsets.only(top: this);
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: this);
  EdgeInsets get rightPadding => EdgeInsets.only(right: this);
  EdgeInsets get leftPadding => EdgeInsets.only(left: this);
  EdgeInsets get allPadding => EdgeInsets.all(this);

  SizedBox get hSpace => SizedBox(width: this);
  SizedBox get vSpace => SizedBox(height: this);
}
