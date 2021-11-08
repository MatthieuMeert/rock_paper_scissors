import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rps/models/rps_model.dart';
import 'package:rps/view_models/game_view_model.dart';

import '../r_p_s_icons_icons.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<GameViewModel>(context).gameModel is RPSModel
            ? 'Rock,paper,scissors'
            : '..., lizard, Spok.'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.group)),
          IconButton(
              onPressed: () {
                Provider.of<GameViewModel>(context, listen: false)
                    .changeGameModel();
              },
              icon: Icon(
                  Provider.of<GameViewModel>(context).gameModel is RPSModel
                      ? RPSIcons.spok
                      : RPSIcons.rock)),
          IconButton(
              onPressed: () {
                Provider.of<GameViewModel>(context, listen: false).reset();
              },
              icon: const Icon(Icons.settings_backup_restore)),
        ],
      ),
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
            children: Provider.of<GameViewModel>(context)
                .getChoicesList()
                .map((choice) => ChoicePicker(choice))
                .toList(),
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
    return Flexible(
      child: InkWell(
        onTap: () {
          Provider.of<GameViewModel>(context, listen: false).play(choice);
        },
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Image.asset('assets/images/$choice.png'),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
