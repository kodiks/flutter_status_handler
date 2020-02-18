import 'package:flutter/material.dart';
import 'package:status_handler/src/status.dart';

class WidgetStatusBuilder extends StatelessWidget {
  final Status status;
  final Widget Function() onLoading;
  final Widget Function() onFocused;
  final Widget Function() onDone;
  final Widget Function() onShowData;
  final Widget Function() onShowValidation;
  final Widget Function() onEmpty;
  final Widget Function() onError;

  const WidgetStatusBuilder({
    Key key,
    @required this.status,
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
    if (status.loading) {
      if (onLoading != null) {
        return onLoading();
      }
    }
    if (status.focused) {
      if (onFocused != null) {
        return onFocused();
      }
    }
    if (status.done) {
      if (onDone != null) {
        return onDone();
      }
    }
    if (status.showData) {
      if (onShowData != null) {
        return onShowData();
      }
    }
    if (status.showValidation) {
      if (onShowValidation != null) {
        return onShowValidation();
      }
    }
    if (status.showEmpty) {
      if (onEmpty != null) {
        return onEmpty();
      }
    }
    if (status.showError) {
      if (onError != null) {
        return onError();
      }
    }

    return Container();
  }
}
