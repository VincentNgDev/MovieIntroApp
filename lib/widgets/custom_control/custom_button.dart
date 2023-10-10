import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final double height;
  final double? width;
  final List<Widget> labelWidget;
  final Color color;
  final double borderRadius;
  final List<BoxShadow>? boxShadowList;
  const CustomButton({
    Key? key,
    required this.onTap,
    this.height = 50,
    this.width,
    required this.labelWidget,
    required this.color,
    this.borderRadius = 20,
    this.boxShadowList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          boxShadow: boxShadowList,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: labelWidget,
        ),
      ),
    );
  }
}
