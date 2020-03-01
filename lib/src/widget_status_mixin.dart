import 'package:rx_command/rx_command.dart';
import 'package:status_handler/src/widget_status_manager.dart';

mixin WidgetStatusMixin {
  WidgetStatusManager widgetSettingManager = WidgetStatusManager();

  //* Content Status Stream Lists
  List<RxCommand> loadStreamList;
  List<RxCommand> doneStreamList;
  List<RxCommand> dataStreamList;
  List<RxCommand> emptyStreamList;
  List<RxCommand> validationStreamList;
  List<RxCommand> errorStreamList;

  //* Property Stream Lists
  List<RxCommand<bool, bool>> focusedSteamList;
  List<RxCommand<bool, bool>> floatLoadingStreamList;

  void addStatusStream({
    List<RxCommand> loadStreamList,
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
      this.loadStreamList = loadStreamList;
      for (final RxCommand stream in this.loadStreamList) {
        stream.listen(
          (_) {
            statusLoad();
          },
        );
      }
    }

    //* done
    if (doneStreamList != null) {
      this.doneStreamList = doneStreamList;
      for (final RxCommand stream in this.doneStreamList) {
        stream.listen(
          (_) {
            statusDone();
          },
        );
      }
    }

    //* data
    if (dataStreamList != null) {
      this.dataStreamList = dataStreamList;
      for (final RxCommand stream in this.dataStreamList) {
        stream.listen(
          (_) {
            statusData();
          },
        );
      }
    }

    //* empty
    if (emptyStreamList != null) {
      this.emptyStreamList = emptyStreamList;
      for (final RxCommand stream in this.emptyStreamList) {
        stream.listen(
          (_) {
            statusEmpty();
          },
        );
      }
    }

    //* validation
    if (validationStreamList != null) {
      this.validationStreamList = validationStreamList;
      for (final RxCommand stream in this.validationStreamList) {
        stream.listen(
          (_) {
            statusValidation();
          },
        );
      }
    }

    //* error
    if (errorStreamList != null) {
      this.errorStreamList = errorStreamList;
      for (final RxCommand stream in this.errorStreamList) {
        stream.listen(
          (_) {
            statusError();
          },
        );
      }
    }

    // #endregion

//* Property Stream
// #region [orange]
    //* focused
    if (focusedSteamList != null) {
      this.focusedSteamList = focusedSteamList;

      for (final RxCommand<bool, bool> stream in this.focusedSteamList) {
        stream.listen((value) {
          focused(value: value);
        });
      }
    }
    //* floatLoading
    if (floatLoadingStreamList != null) {
      this.floatLoadingStreamList = floatLoadingStreamList;

      for (final RxCommand<bool, bool> stream in this.floatLoadingStreamList) {
        stream.listen((value) {
          floatLoading(value: value);
        });
      }
    }

// #endregion
  }

  //#region [purple]

  void statusLoad() {
    widgetSettingManager.contentStatusCommand(ContentStatus.loading);
  }

  void statusDone() {
    widgetSettingManager.contentStatusCommand(ContentStatus.done);
  }

  void statusData() {
    widgetSettingManager.contentStatusCommand(ContentStatus.data);
  }

  void statusEmpty() {
    widgetSettingManager.contentStatusCommand(ContentStatus.empty);
  }

  void statusValidation() {
    widgetSettingManager.contentStatusCommand(ContentStatus.validation);
  }

  void statusError() {
    widgetSettingManager.contentStatusCommand(ContentStatus.error);
  }

  void statusRefresh() {
    widgetSettingManager.lastStatusCommand();
  }

  void focused({bool value}) {
    widgetSettingManager.focusedCommand(value);
    widgetSettingManager.lastStatusCommand();
  }

  void floatLoading({bool value}) {
    widgetSettingManager.floatLoadingCommand(value);
    widgetSettingManager.lastStatusCommand();
  }

  // #endregion
}
