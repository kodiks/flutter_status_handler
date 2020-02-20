import 'package:flutter/material.dart';
import 'package:status_handler/src/status_handler_manager.dart';
import 'package:status_handler/src/status.dart';

class WidgetStatusHandler extends StatefulWidget {
  final StatusHandlerManager manager;
  final Widget Function() onLoading;
  final Widget Function() onFocused;
  final Widget Function() onDone;
  final Widget Function() onShowData;
  final Widget Function() onShowValidation;
  final Widget Function() onEmpty;
  final Widget Function() onError;

  final Widget Function(Status) builder;

  const WidgetStatusHandler({
    Key key,
    @required this.manager,
    this.builder,
    this.onLoading,
    this.onFocused,
    this.onDone,
    this.onShowData,
    this.onShowValidation,
    this.onEmpty,
    this.onError,
  }) : super(key: key);
  @override
  _WidgetStatusHandlerState createState() => _WidgetStatusHandlerState();
}

class _WidgetStatusHandlerState extends State<WidgetStatusHandler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Status>(
        stream: widget.manager.statusCommand,
        initialData: widget.manager.statusCommand.lastResult,
        builder: (context, snapshot) {
          final Status status = snapshot.data;
          if (status.loading) {
            if (widget.onLoading != null) {
              return widget.onLoading();
            }
          }
          if (status.focused) {
            if (widget.onFocused != null) {
              return widget.onFocused();
            }
          }
          if (status.done) {
            if (widget.onDone != null) {
              return widget.onDone();
            }
          }
          if (status.showData) {
            if (widget.onShowData != null) {
              return widget.onShowData();
            }
          }
          if (status.showValidation) {
            if (widget.onShowValidation != null) {
              return widget.onShowValidation();
            }
          }
          if (status.showEmpty) {
            if (widget.onEmpty != null) {
              return widget.onEmpty();
            }
          }
          if (status.showError) {
            if (widget.onError != null) {
              return widget.onError();
            }
          }

          if (widget.builder != null) {
            return widget.builder(snapshot.data);
          }

          return Container();
        });
  }
}
