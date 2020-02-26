import 'package:rx_command/rx_command.dart';
import 'package:status_handler/src/status.dart';

class StatusHandlerManager {
  RxCommand<Status, Status> statusCommand;

  RxCommand<bool, Status> focusedCommand;
  RxCommand<bool, Status> showLoadingIndicatorCommand;
  RxCommand<void, Status> loadingCommand;
  RxCommand<void, Status> doneCommand;
  RxCommand<void, Status> showDataCommand;
  RxCommand<void, Status> showValidationCommand;
  RxCommand<void, Status> showEmptyCommand;
  RxCommand<void, Status> showErrorCommand;
  RxCommand<void, Status> refreshCommand;

  StatusHandlerManager() {
    statusCommand = RxCommand.createSync((statusSetting) => statusSetting);

    statusCommand.execute(Status());

    //* Focused
    focusedCommand = RxCommand.createSync((value) {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.focused = value;
      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Show Loading Indicator Command
    showLoadingIndicatorCommand = RxCommand.createSync((value) {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.showLoadingIndicator = value;
      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Loading
    loadingCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.loading = true;

      _statusSetting.done = false;
      _statusSetting.showData = false;
      _statusSetting.showValidation = false;
      _statusSetting.showEmpty = false;
      _statusSetting.showError = false;

      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Done
    doneCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.loading = false;
      _statusSetting.done = true;
      _statusSetting.showData = false;
      _statusSetting.showValidation = false;
      _statusSetting.showEmpty = false;
      _statusSetting.showError = false;

      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Show Data
    showDataCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.loading = false;
      _statusSetting.done = false;
      _statusSetting.showData = true;
      _statusSetting.showValidation = false;
      _statusSetting.showEmpty = false;
      _statusSetting.showError = false;
      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Validation
    showValidationCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.loading = false;
      _statusSetting.done = false;
      _statusSetting.showData = false;
      _statusSetting.showValidation = true;
      _statusSetting.showEmpty = false;
      _statusSetting.showError = false;

      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Empty
    showEmptyCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.loading = false;
      _statusSetting.done = false;
      _statusSetting.showData = false;
      _statusSetting.showValidation = false;
      _statusSetting.showEmpty = true;
      _statusSetting.showError = false;
      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Error
    showErrorCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      _statusSetting.loading = false;
      _statusSetting.done = false;
      _statusSetting.showData = false;
      _statusSetting.showValidation = false;
      _statusSetting.showEmpty = false;
      _statusSetting.showError = true;

      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });

    //* Refresh
    refreshCommand = RxCommand.createSyncNoParam(() {
      final Status _statusSetting = statusCommand.lastResult;

      return _statusSetting;
    })
      ..listen((statusSetting) {
        statusCommand(statusSetting);
      });
  }
}
