import 'package:flutter/material.dart';

class SizeHelper {
  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;
}
