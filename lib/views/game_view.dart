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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'assets/images/${Provider.of<GameViewModel>(context).getAnswer() ?? 'unknown'}.png'),
                      ),
                      Container(
                        child: Text(
                          '${Provider.of<GameViewModel>(context).getGamesLost()}',
                          style: DefaultTextStyle.of(context)
                              .style
                              .apply(fontSizeFactor: 2.0),
                        ),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                ),
              ),
              const Divider(),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'assets/images/${Provider.of<GameViewModel>(context).getChoice() ?? 'unknown'}.png'),
                      ),
                      Text(
                        '${Provider.of<GameViewModel>(context).getGamesWon()}',
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 2.0),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoicePicker(
                  Provider.of<GameViewModel>(context).getChoicesList()[0]),
              ChoicePicker(
                  Provider.of<GameViewModel>(context).getChoicesList()[1]),
              ChoicePicker(
                  Provider.of<GameViewModel>(context).getChoicesList()[2])
            ],
          ),
        )
      ],
    );
  }
}

class ChoicePicker extends StatelessWidget {
  String choice;
  ChoicePicker(this.choice, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<GameViewModel>(context, listen: false).play(choice);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        child: Image.asset('assets/images/$choice.png'),
        alignment: Alignment.center,
      ),
    );
  }
}
