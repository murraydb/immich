import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:immich_mobile/extensions/build_context_extensions.dart';

class ConfirmDialog extends ConsumerWidget {
  final Function onOk;
  final String title;
  final String content;
  final String cancel;
  final String ok;

  const ConfirmDialog({
    super.key,
    required this.onOk,
    required this.title,
    required this.content,
    this.cancel = "delete_dialog_cancel",
    this.ok = "backup_controller_page_background_battery_info_ok",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(title).tr(),
      content: Text(content).tr(),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(
            cancel,
            style: TextStyle(
              color: context.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
        ),
        TextButton(
          onPressed: () {
            onOk();
            context.pop(true);
          },
          child: Text(
            ok,
            style: TextStyle(
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
        ),
      ],
    );
  }
}
