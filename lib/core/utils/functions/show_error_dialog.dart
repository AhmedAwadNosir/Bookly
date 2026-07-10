import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookly/core/utils/functions/show_awesome_dialog.dart';
import 'package:flutter/widgets.dart';

showErrorDialog({required BuildContext context, required String errorMessage}) {
  showAwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    dialogTitle: "somthing` wrong",
    dialogDesc: errorMessage,
  );
}
