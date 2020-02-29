import 'package:rx_command/rx_command.dart';
import 'package:status_handler/src/status_handler_manager.dart';

mixin StatusHandlerMixin {
  StatusHandlerManager statusHandlerManager = StatusHandlerManager();
  List<RxCommand> loadStreamList;
  List<RxCommand> doneStreamList;
  List<RxCommand> showDataStreamList;
  List<RxCommand> showEmptyStreamList;
  List<RxCommand> showValidationStreamList;
  List<RxCommand> showErrorStreamList;
  List<RxCommand> refreshStreamList;

  void addStream({
    List<RxCommand> loadStreamList,
    List<RxCommand> doneStreamList,
    List<RxCommand> showDataStreamList,
    List<RxCommand> showEmptyStreamList,
    List<RxCommand> showValidationStreamList,
    List<RxCommand> showErrorStreamList,
    List<RxCommand> refreshStreamList,
  }) {
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

    //* showData
    if (showDataStreamList != null) {
      this.showDataStreamList = showDataStreamList;
      for (final RxCommand stream in this.showDataStreamList) {
        stream.listen(
          (_) {
            statusShowData();
          },
        );
      }
    }

    //* showEmpty
    if (showEmptyStreamList != null) {
      this.showEmptyStreamList = showEmptyStreamList;
      for (final RxCommand stream in this.showEmptyStreamList) {
        stream.listen(
          (_) {
            statusEmpty();
          },
        );
      }
    }

    //* showValidation
    if (showValidationStreamList != null) {
      this.showEmptyStreamList = showEmptyStreamList;
      for (final RxCommand stream in this.showValidationStreamList) {
        stream.listen(
          (_) {
            statusShowValidation();
          },
        );
      }
    }

    //* showError
    if (showErrorStreamList != null) {
      this.showErrorStreamList = showErrorStreamList;
      for (final RxCommand stream in this.showErrorStreamList) {
        stream.listen(
          (_) {
            statusError();
          },
        );
      }
    }
    //* statusRefresh
    if (refreshStreamList != null) {
      this.refreshStreamList = refreshStreamList;
      for (final RxCommand stream in this.refreshStreamList) {
        stream.listen(
          (_) {
            statusRefresh();
          },
        );
      }
    }
  }

  void setFocused({bool value}) {
    statusHandlerManager.focusedCommand(value);
  }

  void setShowLoadingIndicator({bool value}) {
    statusHandlerManager.showLoadingIndicatorCommand(value);
  }

  void statusLoad() {
    statusHandlerManager.loadingCommand();
  }

  void statusDone() {
    statusHandlerManager.doneCommand();
  }

  void statusShowData() {
    statusHandlerManager.showDataCommand();
  }

  void statusEmpty() {
    statusHandlerManager.showEmptyCommand();
  }

  void statusShowValidation() {
    statusHandlerManager.showValidationCommand();
  }

  void statusError() {
    statusHandlerManager.showErrorCommand();
  }

  void statusRefresh() {
    statusHandlerManager.refreshCommand();
  }
}
