// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

/// アラート（ダイアログ）を開く共通処理（flutter_lifetime_log2 の LifetimeDialog と同じ作り）
Future<void> ReceiptDialog({
  required BuildContext context,
  required Widget widget,
  double paddingTop = 0,
  double paddingRight = 0,
  double paddingBottom = 0,
  double paddingLeft = 0,
  bool clearBarrierColor = false,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: clearBarrierColor ? Colors.transparent : Colors.blueGrey.withValues(alpha: 0.3),
    builder: (_) {
      return Container(
        padding: EdgeInsets.only(top: paddingTop, right: paddingRight, bottom: paddingBottom, left: paddingLeft),
        child: Dialog(
          backgroundColor: Colors.blueGrey.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          insetPadding: const EdgeInsets.all(30),
          child: widget,
        ),
      );
    },
  );
}
