import 'package:rx_command/rx_command.dart';

enum ContentStatus {
  loading,
  ready,
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
    this.contentStatus = ContentStatus.ready,
  });
}

class WidgetStatusManager {
  RxCommand<WidgetStatus, WidgetStatus> widgetStatusCommand;

  RxCommand<bool, WidgetStatus> focusedCommand;
  RxCommand<bool, WidgetStatus> floatLoadingCommand;

  RxCommand<ContentStatus, ContentStatus> lastStatusCommand;
  RxCommand<ContentStatus, WidgetStatus> contentStatusCommand;

  WidgetStatusManager() {
    widgetStatusCommand = RxCommand.createSync((widgetStatus) => widgetStatus)..execute(WidgetStatus());

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

  //* Content Status Stream Lists
  List<RxCommand> _loadStreamList;
  List<RxCommand> _readyStreamList;
  List<RxCommand> _doneStreamList;
  List<RxCommand> _dataStreamList;
  List<RxCommand> _emptyStreamList;
  List<RxCommand> _validationStreamList;
  List<RxCommand> _errorStreamList;

  //* Property Stream Lists
  List<RxCommand<bool, bool>> _focusedSteamList;
  List<RxCommand<bool, bool>> _floatLoadingStreamList;

  void addStatusStream({
    List<RxCommand> loadStreamList,
    List<RxCommand> readyStreamList,
    List<RxCommand> doneStreamList,
    List<RxCommand> dataStreamList,
    List<RxCommand> emptyStreamList,
    List<RxCommand> validationStreamList,
    List<RxCommand> errorStreamList,
    List<RxCommand<bool, bool>> focusedSteamList,
    List<RxCommand<bool, bool>> floatLoadingStreamList,
  }) {
    //* Content Status
    // #region [blue]
    //* Load
    if (loadStreamList != null) {
      _loadStreamList = loadStreamList;
      for (final RxCommand stream in _loadStreamList) {
        stream.listen(
          (_) {
            load();
          },
        );
      }
    }

    //* ready
    if (readyStreamList != null) {
      _readyStreamList = readyStreamList;
      for (final RxCommand stream in _readyStreamList) {
        stream.listen(
          (_) {
            ready();
          },
        );
      }
    }

    //* done
    if (doneStreamList != null) {
      _doneStreamList = doneStreamList;
      for (final RxCommand stream in _doneStreamList) {
        stream.listen(
          (_) {
            done();
          },
        );
      }
    }

    //* data
    if (dataStreamList != null) {
      _dataStreamList = dataStreamList;
      for (final RxCommand stream in _dataStreamList) {
        stream.listen(
          (_) {
            data();
          },
        );
      }
    }

    //* empty
    if (emptyStreamList != null) {
      _emptyStreamList = emptyStreamList;
      for (final RxCommand stream in _emptyStreamList) {
        stream.listen(
          (_) {
            empty();
          },
        );
      }
    }

    //* validation
    if (validationStreamList != null) {
      _validationStreamList = validationStreamList;
      for (final RxCommand stream in _validationStreamList) {
        stream.listen(
          (_) {
            validation();
          },
        );
      }
    }

    //* error
    if (errorStreamList != null) {
      _errorStreamList = errorStreamList;
      for (final RxCommand stream in _errorStreamList) {
        stream.listen(
          (_) {
            error();
          },
        );
      }
    }

    // #endregion

//* Property Stream
// #region [orange]
    //* focused
    if (focusedSteamList != null) {
      _focusedSteamList = focusedSteamList;

      for (final RxCommand<bool, bool> stream in _focusedSteamList) {
        stream.listen((value) {
          focused(value: value);
        });
      }
    }

    //* floatLoading
    if (floatLoadingStreamList != null) {
      _floatLoadingStreamList = floatLoadingStreamList;

      for (final RxCommand<bool, bool> stream in _floatLoadingStreamList) {
        stream.listen((value) {
          floatLoading(value: value);
        });
      }
    }

// #endregion
  }

  //#region [purple]

  void load() {
    lastStatusCommand(ContentStatus.loading);
  }

  void ready() {
    lastStatusCommand(ContentStatus.ready);
  }

  void done() {
    lastStatusCommand(ContentStatus.done);
  }

  void data() {
    lastStatusCommand(ContentStatus.data);
  }

  void empty() {
    lastStatusCommand(ContentStatus.empty);
  }

  void validation() {
    lastStatusCommand(ContentStatus.validation);
  }

  void error() {
    lastStatusCommand(ContentStatus.error);
  }

  void refresh() {
    lastStatusCommand();
  }

  void focused({bool value}) {
    focusedCommand(value);
    lastStatusCommand();
  }

  void floatLoading({bool value}) {
    floatLoadingCommand(value);
    lastStatusCommand();
  }

  // #endregion
}
