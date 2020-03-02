import 'package:rx_command/rx_command.dart';

enum ContentStatus {
  loading,
  done,
  data,
  empty,
  validation,
  error,
}

class WidgetStatus {
  bool focused;
  bool floatLoading;

  ContentStatus contentStatus;

  WidgetStatus({
    this.focused = false,
    this.floatLoading = false,
    this.contentStatus = ContentStatus.done,
  });
}

class WidgetStatusManager {
  RxCommand<WidgetStatus, WidgetStatus> widgetStatusCommand;

  RxCommand<bool, WidgetStatus> focusedCommand;
  RxCommand<bool, WidgetStatus> floatLoadingCommand;

  RxCommand<ContentStatus, ContentStatus> lastStatusCommand;
  RxCommand<ContentStatus, WidgetStatus> contentStatusCommand;

  WidgetStatusManager() {
    widgetStatusCommand = RxCommand.createSync((statusSetting) => statusSetting);

    widgetStatusCommand.execute(WidgetStatus());

    //* Focused
    focusedCommand = RxCommand.createSync((value) {
      final WidgetStatus _widgetSetting = widgetStatusCommand.lastResult;

      _widgetSetting.focused = value;
      return _widgetSetting;
    })
      ..listen((statusSetting) {
        widgetStatusCommand(statusSetting);
      });

    //* Show Float Loading Indicator Command
    floatLoadingCommand = RxCommand.createSync((value) {
      final WidgetStatus _widgetSetting = widgetStatusCommand.lastResult;

      _widgetSetting.floatLoading = value;
      return _widgetSetting;
    })
      ..listen((statusSetting) {
        widgetStatusCommand(statusSetting);
      });

    lastStatusCommand = RxCommand.createSync((lastStatus) {
      final _lastStatus = lastStatus ??= lastStatusCommand.lastResult ??= ContentStatus.done;
      return _lastStatus;
    })
      ..listen((lastStatus) {
        contentStatusCommand(lastStatus);
      });

    //* Content Status Command
    contentStatusCommand = RxCommand.createSync((contentStatus) {
      final WidgetStatus _widgetSetting = widgetStatusCommand.lastResult;

      _widgetSetting.contentStatus = contentStatus;
      return _widgetSetting;
    })
      ..listen((statusSetting) {
        widgetStatusCommand(statusSetting);
      });
  }
}
