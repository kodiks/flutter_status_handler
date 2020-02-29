import 'package:rx_command/rx_command.dart';
import 'package:status_handler/src/status_handler_manager.dart';

mixin StatusHandlerMixin {
  StatusHandlerManager statusHandlerManager = StatusHandlerManager();

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
      for (final RxCommand stream in loadStreamList) {
        stream.listen(
          (_) {
            statusLoad();
          },
        );
      }
    }

    //* done
    if (doneStreamList != null) {
      for (final RxCommand stream in doneStreamList) {
        stream.listen(
          (_) {
            statusDone();
          },
        );
      }
    }

    //* showData
    if (showDataStreamList != null) {
      for (final RxCommand stream in showDataStreamList) {
        stream.listen(
          (_) {
            statusShowData();
          },
        );
      }
    }

    //* showEmpty
    if (showEmptyStreamList != null) {
      for (final RxCommand stream in showEmptyStreamList) {
        stream.listen(
          (_) {
            statusEmpty();
          },
        );
      }
    }

    //* showValidation
    if (showValidationStreamList != null) {
      for (final RxCommand stream in showValidationStreamList) {
        stream.listen(
          (_) {
            statusShowValidation();
          },
        );
      }
    }

    //* showError
    if (showErrorStreamList != null) {
      for (final RxCommand stream in showErrorStreamList) {
        stream.listen(
          (_) {
            statusError();
          },
        );
      }
    }
    //* statusRefresh
    if (refreshStreamList != null) {
      for (final RxCommand stream in refreshStreamList) {
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
