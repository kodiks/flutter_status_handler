import 'package:flutter/material.dart';

import 'package:status_handler/src/widget_status_manager.dart';

class WidgetStatusHandler extends StatefulWidget {
  final WidgetStatusManager manager;

  final Widget Function(WidgetStatus) onLoading;
  final Widget Function(WidgetStatus) onReady;
  final Widget Function(WidgetStatus) onDone;
  final Widget Function(WidgetStatus) onData;
  final Widget Function(WidgetStatus) onEmpty;
  final Widget Function(WidgetStatus) onValidation;
  final Widget Function(WidgetStatus) onError;

  final Widget Function(WidgetStatus) builder;

  const WidgetStatusHandler({
    Key key,
    @required this.manager,
    this.onLoading,
    this.onReady,
    this.onDone,
    this.onData,
    this.onEmpty,
    this.onValidation,
    this.onError,
    this.builder,
  }) : super(key: key);
  @override
  _WidgetStatusHandlerState createState() => _WidgetStatusHandlerState();
}

class _WidgetStatusHandlerState extends State<WidgetStatusHandler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WidgetStatus>(
        stream: widget.manager.widgetStatusCommand,
        initialData: widget.manager.widgetStatusCommand.lastResult,
        builder: (context, snapshot) {
          final WidgetStatus widgetStatus = snapshot.data;

          switch (widgetStatus.contentStatus) {
            case ContentStatus.loading:
              if (widget.onLoading != null) {
                return widget.onLoading(widgetStatus);
              }
              break;
            case ContentStatus.ready:
              if (widget.onReady != null) {
                return widget.onReady(widgetStatus);
              }
              break;
            case ContentStatus.done:
              if (widget.onDone != null) {
                return widget.onDone(widgetStatus);
              }
              break;
            case ContentStatus.data:
              if (widget.onData != null) {
                return widget.onData(widgetStatus);
              }
              break;

            case ContentStatus.empty:
              if (widget.onEmpty != null) {
                return widget.onEmpty(widgetStatus);
              }
              break;
            case ContentStatus.validation:
              if (widget.onValidation != null) {
                return widget.onValidation(widgetStatus);
              }
              break;
            case ContentStatus.error:
              if (widget.onError != null) {
                return widget.onError(widgetStatus);
              }
              break;

            default:
          }

          if (widget.builder != null) {
            return widget.builder(widgetStatus);
          }

          return Container();
        });
  }
}
