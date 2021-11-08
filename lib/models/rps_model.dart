class RPSModel {
  List<String> choicesList = ['rock', 'paper', 'scissors'];
  String? choice;
  String? answer;
  int gamesWon = 0;
  int gamesLost = 0;
  int gamesDraw = 0;

  RPSModel();

  addGameToStats() {
    if (choice == answer) {
      gamesDraw++;
    } else if (choice == 'rock' && answer == 'scissors' ||
        choice == 'paper' && answer == 'rock' ||
        choice == 'scissors' && answer == 'paper') {
      gamesWon++;
    } else if (choice == 'rock' && answer == 'paper' ||
        choice == 'paper' && answer == 'scissors' ||
        choice == 'scissors' && answer == 'rock') {
      gamesLost++;
    }
  }
}
