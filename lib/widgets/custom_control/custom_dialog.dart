import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomDialog {
  /// Show Alert Dialog
  static Future alertDialog({
    required BuildContext context,
    List<String>? alertsList,
    Widget? titleWidget,
    String? buttonText,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              /// Title
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: titleWidget ??
                        const Text(
                          'Alert',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),

              /// Subtitle List
              if (alertsList != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        alertsList.length,
                        (index) => Text('- ${alertsList[index]}'),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                color: Colors.lightGreen,

                /// Change Color Button
                borderRadius: 12,
                height: 40,
                width: 200,
                labelWidget: [
                  Text(
                    buttonText ?? 'OK',
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}