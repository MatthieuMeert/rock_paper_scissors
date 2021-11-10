abstract class GameModel {
  abstract List<String> choicesList;
  String? choice;
  String? answer;
  int gamesWon = 0;
  int gamesLost = 0;
  int gamesDraw = 0;

  String getDescription(String choice) {
    return 'Description missing.';
  }

  addGameToStats();

  syncDataWithProvider();
  updateSharedPrefrences();
  reset() {
    gamesWon = 0;
    gamesLost = 0;
    gamesDraw = 0;
    updateSharedPrefrences();
  }
}
