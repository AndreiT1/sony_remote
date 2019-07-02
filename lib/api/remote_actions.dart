class RemoteAction {
  String action;
  String value;

  RemoteAction.fromJson(Map json) {
    this.action = json['name'];
    this.value = json['value'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.action + " ###  " + this.value;
  }
}
