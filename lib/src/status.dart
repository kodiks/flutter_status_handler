class Status {
  bool focused;
  bool showLoadingIndicator;
  bool loading;
  bool done;
  bool showData;
  bool showValidation;
  bool showEmpty;
  bool showError;

  Status({
    this.focused = false,
    this.loading = false,
    this.done = true,
    this.showData = false,
    this.showValidation = false,
    this.showEmpty = false,
    this.showError = false,
    this.showLoadingIndicator = false,
  });
}
