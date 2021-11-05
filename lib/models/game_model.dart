class GameModel {
  List<String> choicesList = ['rock', 'paper', 'scisors'];
  String? choice;
  String? answer;
  int gamesWon = 0;
  int gamesLost = 0;
  int gamesDraw = 0;

  addGameToStats() {
    if (choice == answer) {
      gamesDraw++;
    } else if (choice == 'rock' && answer == 'scisors' ||
        choice == 'paper' && answer == 'rock' ||
        choice == 'scisors' && answer == 'paper') {
      gamesWon++;
    } else if (choice == 'rock' && answer == 'paper' ||
        choice == 'paper' && answer == 'scisors' ||
        choice == 'scisors' && answer == 'rock') {
      gamesLost++;
    }
  }
}
