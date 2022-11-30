import '../model/TileModel.dart';

String selectedTile = "";
int selectedIndex = 0;
bool selected = true;
int points = 0;

List<TileModel> myPairs = <TileModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked(){

  List<bool> yoClicked = <bool>[];
  List<TileModel> myPairs = <TileModel>[];
  myPairs = getPairs();
  for(int i=0;i<myPairs.length;i++){
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel>  getPairs(){

  List<TileModel> pairs = <TileModel>[];

  TileModel tileModel = TileModel();

  //1
  tileModel.setImageAssetPath("assets/cards/angular.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //2
  tileModel.setImageAssetPath("assets/cards/d3.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //3
  tileModel.setImageAssetPath("assets/cards/evista.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //4
  tileModel.setImageAssetPath("assets/cards/jenkins.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();
  //5
  tileModel.setImageAssetPath("assets/cards/postcss.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //6
  tileModel.setImageAssetPath("assets/cards/react.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //7
  tileModel.setImageAssetPath("assets/cards/redux.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //8
  tileModel.setImageAssetPath("assets/cards/sass.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();


  //9
  tileModel.setImageAssetPath("assets/cards/ts.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //10
  tileModel.setImageAssetPath("assets/cards/webpack.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();
  return pairs;
}

List<TileModel>  getQuestionPairs(){

  List<TileModel> pairs = <TileModel>[];

  TileModel tileModel = TileModel();

  //1
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //2
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //3
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //4
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();
  //5
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //6
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //7
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //8
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();


  //9
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //10
  tileModel.setImageAssetPath("assets/cards/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();
  return pairs;
}