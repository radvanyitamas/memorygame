class TileModel{

  String? imageAssetPath = "";
  bool? isSelected = false;
  bool? isMatched = false;

  TileModel({this.imageAssetPath, this.isSelected, this.isMatched});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  String getImageAssetPath(){
    return imageAssetPath!;
  }

  void setIsSelected(bool getIsSelected){
    isSelected = getIsSelected;
  }

  bool getIsSelected(){
    return isSelected!;
  }


  void setIsMatched(bool getIsMatched){
    isMatched = getIsMatched;
  }

  bool getIsMatched(){
    return isMatched!;
  }
}