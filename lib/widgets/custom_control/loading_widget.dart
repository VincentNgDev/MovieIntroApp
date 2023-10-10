import 'package:flutter/material.dart';

class LoadingWidgetPlus extends StatelessWidget {
  /// Custom Loading Widget
  final Widget? loadingWidget;
  const LoadingWidgetPlus({Key? key, this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loadingWidget ?? const CircularProgressIndicator(),
    );
  }
}