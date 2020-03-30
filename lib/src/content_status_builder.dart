import 'package:flutter/material.dart';
import 'package:status_handler/src/widget_status_manager.dart';

class ContentStatusBuilder extends StatelessWidget {
  final ContentStatus contentStatus;

  final Widget Function() onLoading;
  final Widget Function() onReady;
  final Widget Function() onDone;
  final Widget Function() onData;
  final Widget Function() onEmpty;
  final Widget Function() onValidation;
  final Widget Function() onError;

  const ContentStatusBuilder({
    Key key,
    @required this.contentStatus,
    this.onLoading,
    this.onDone,
    this.onReady,
    this.onData,
    this.onEmpty,
    this.onValidation,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (contentStatus) {
      case ContentStatus.loading:
        if (onLoading != null) {
          return onLoading();
        }
        break;
      case ContentStatus.ready:
        if (onReady != null) {
          return onReady();
        }
        break;
      case ContentStatus.done:
        if (onDone != null) {
          return onDone();
        }
        break;
      case ContentStatus.data:
        if (onData != null) {
          return onData();
        }
        break;
      case ContentStatus.empty:
        if (onEmpty != null) {
          return onEmpty();
        }
        break;
      case ContentStatus.validation:
        if (onValidation != null) {
          return onValidation();
        }
        break;
      case ContentStatus.error:
        if (onError != null) {
          return onError();
        }
        break;
    }

    return Container();
  }
}
