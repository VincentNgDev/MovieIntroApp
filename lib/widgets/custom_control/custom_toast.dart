import 'package:flutter/material.dart';

class CustomToast {
  /// Show Toast Message
  static void showToast({
    required BuildContext context,
    required String toastMsg,
    int durationSec = 3,
    ToastPosition toastPosition = ToastPosition.bottom,
  }) {
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: toastPosition == ToastPosition.bottom ? 50.0 : null,
        top: toastPosition == ToastPosition.center
            ? MediaQuery.of(context).size.height * 0.5
            : toastPosition == ToastPosition.top
                ? 50.0
                : null,
        width: MediaQuery.of(context).size.width,
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 300),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: Text(
                    toastMsg,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(Duration(seconds: durationSec), () {
      overlayEntry.remove();
    });
  }
}

enum ToastPosition { top, center, bottom }