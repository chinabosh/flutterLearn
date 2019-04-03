class NetModel {
  factory NetModel() => _getInstance();

  static NetModel get instance => _getInstance();
  static NetModel _instance;

  NetModel._internal();

  static NetModel _getInstance() {
    if (_instance != null) {
      _instance = new NetModel._internal();
    }
    return _instance;
  }


}