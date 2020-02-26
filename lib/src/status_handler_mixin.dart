import 'package:status_handler/src/status_handler_manager.dart';

mixin StatusHandlerMixin {
  StatusHandlerManager statusHandlerManager = StatusHandlerManager();

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

  void statusShowValidation() {
    statusHandlerManager.showValidationCommand();
  }

  void statusEmpty() {
    statusHandlerManager.showEmptyCommand();
  }

  void statusError() {
    statusHandlerManager.showErrorCommand();
  }

  void statusRefresh() {
    statusHandlerManager.refreshCommand();
  }
}
