import 'package:flutter/material.dart';
import 'package:status_handler/src/status.dart';

class WidgetStatusBuilder extends StatelessWidget {
  final Status statusSetting;
  final Widget Function() onLoading;
  final Widget Function() onFocused;
  final Widget Function() onDone;
  final Widget Function() onShowData;
  final Widget Function() onShowValidation;
  final Widget Function() onEmpty;
  final Widget Function() onError;

  const WidgetStatusBuilder({
    Key key,
    @required this.statusSetting,
    this.onLoading,
    this.onFocused,
    this.onDone,
    this.onShowData,
    this.onShowValidation,
    this.onEmpty,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (statusSetting.loading) {
      if (onLoading != null) {
        return onLoading();
      }
    }
    if (statusSetting.focused) {
      if (onFocused != null) {
        return onFocused();
      }
    }
    if (statusSetting.done) {
      if (onDone != null) {
        return onDone();
      }
    }
    if (statusSetting.showData) {
      if (onShowData != null) {
        return onShowData();
      }
    }
    if (statusSetting.showValidation) {
      if (onShowValidation != null) {
        return onShowValidation();
      }
    }
    if (statusSetting.showEmpty) {
      if (onEmpty != null) {
        return onEmpty();
      }
    }
    if (statusSetting.showError) {
      if (onError != null) {
        return onError();
      }
    }

    return Container();
  }
}
