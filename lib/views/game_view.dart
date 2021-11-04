import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rps/view_models/game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rock, paper, scisors.')),
      body: GameBoard(),
    );
  }
}

class GameBoard extends StatelessWidget {
  GameBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Text(Provider.of<GameViewModel>(context).getAnswer() ?? 'not chosent yet'),
                  alignment: Alignment.center,
                ),
              ),
              const Divider(),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Text(Provider.of<GameViewModel>(context).getChoice() ?? 'click to choose'),
                  alignment: Alignment.center,
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        Container(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoicePicker(Provider.of<GameViewModel>(context).getChoicesList()[0]),
              ChoicePicker(Provider.of<GameViewModel>(context).getChoicesList()[1]),
              ChoicePicker(Provider.of<GameViewModel>(context).getChoicesList()[2])
            ],
          ),
        )
      ],
    );
  }
}

class ChoicePicker extends StatelessWidget {
  String type;
  ChoicePicker(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameViewModel = GameViewModel();
    return InkWell(
      onTap: () {
        Provider.of<GameViewModel>(context, listen : false).setChoice(type);
        Provider.of<GameViewModel>(context, listen : false).generateRandomAnswer();
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
        ),
        child: Text(type),
        alignment: Alignment.center,
      ),
    );
  }
}
