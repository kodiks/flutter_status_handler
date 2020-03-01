import 'package:flutter/material.dart';

import 'package:status_handler/src/widget_status_manager.dart';

class WidgetStatusHandler extends StatefulWidget {
  final WidgetStatusManager manager;

  final Widget Function(WidgetStatus) onLoading;
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
          final WidgetStatus widgetSetting = snapshot.data;

          switch (widgetSetting.contentStatus) {
            case ContentStatus.loading:
              if (widget.onLoading != null) {
                return widget.onLoading(widgetSetting);
              }
              break;
            case ContentStatus.done:
              if (widget.onDone != null) {
                return widget.onDone(widgetSetting);
              }
              break;
            case ContentStatus.data:
              if (widget.onData != null) {
                return widget.onData(widgetSetting);
              }
              break;

            case ContentStatus.empty:
              if (widget.onEmpty != null) {
                return widget.onEmpty(widgetSetting);
              }
              break;
            case ContentStatus.validation:
              if (widget.onValidation != null) {
                return widget.onValidation(widgetSetting);
              }
              break;
            case ContentStatus.error:
              if (widget.onError != null) {
                return widget.onError(widgetSetting);
              }
              break;

            default:
          }

          if (widget.builder != null) {
            return widget.builder(widgetSetting);
          }

          return Container();
        });
  }
}
