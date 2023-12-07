class UnitConverter{
  static const int b = 1;
  static const int kb = 1024;
  static const int mb = 1048576;
  static const int gb = 1073741824;
  static const int tb = 1099511627776;


  unitConverter(double value) {
    if (value > tb) {
      return (value / tb).toStringAsFixed(1) + " TB";
    }
    if (value > gb) {
      return (value / gb).toStringAsFixed(1) + " GB";
    } else if (value > mb) {

      return (value / mb).toStringAsFixed(1) + " MB";
    } else if (value > b) {

      return (value / kb).toStringAsFixed(1) + " KB";
    } else {
      return "0.0 KB";
    }
  }

}
