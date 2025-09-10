import 'dart:io';
import 'package:flutter/material.dart';

class QrStyleProvider extends ChangeNotifier {
  Color _backgroundColor = Colors.white;
  Color _foregroundColor = Colors.black;
  File? _backgroundImage;
  String? _logoAsset;
  File? _logoFile;

  Color get backgroundColor => _backgroundColor;
  Color get foregroundColor => _foregroundColor;
  File? get backgroundImage => _backgroundImage;
  String? get logoAsset => _logoAsset;
  File? get logoFile => _logoFile;

  void setBackground(Color color) {
    _backgroundColor = color;
    _backgroundImage = null;
    notifyListeners();
  }

  void setBackgroundImage(File image) {
    _backgroundImage = image;
    notifyListeners();
  }

  void setForeground(Color color) {
    _foregroundColor = color;
    notifyListeners();
  }

  void setLogo(String assetPath){
    _logoAsset = assetPath;
    _logoFile = null;
    notifyListeners();
  }

  void setLogoFile(File file){
    _logoFile = file;
    _logoAsset = null;
    notifyListeners();
  }

}
