//import 'package:back_jack_app/consts.dart';

import 'dart:math';

import 'package:back_jack_app/widgets/cards_grid_view.dart';
import 'package:back_jack_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isGameStarted = false;

  List<Image> myCards = [];
  List<Image> dealersCards = [];

  String? playerFirsCards;
  String? playerSecondCards;

  String? dealersFirsCards;
  String? dealersSecondCards;

  int playerScore = 0;
  int dealerScore = 0;

  final Map<String, int> deckOfCards = {
    "cards/2.1.png": 2,
    "cards/2.2.png": 2,
    "cards/2.3.png": 2,
    "cards/2.4.png": 2,
    "cards/3.1.png": 3,
    "cards/3.2.png": 3,
    "cards/3.3.png": 3,
    "cards/3.4.png": 3,
    "cards/4.1.png": 4,
    "cards/4.2.png": 4,
    "cards/4.3.png": 4,
    "cards/4.4.png": 4,
    "cards/5.1.png": 5,
    "cards/5.2.png": 5,
    "cards/5.3.png": 5,
    "cards/5.4.png": 5,
    "cards/6.1.png": 6,
    "cards/6.2.png": 6,
    "cards/6.3.png": 6,
    "cards/6.4.png": 6,
    "cards/7.1.png": 7,
    "cards/7.2.png": 7,
    "cards/7.3.png": 7,
    "cards/7.4.png": 7,
    "cards/8.1.png": 8,
    "cards/8.2.png": 8,
    "cards/8.3.png": 8,
    "cards/8.4.png": 8,
    "cards/9.1.png": 9,
    "cards/9.2.png": 9,
    "cards/9.3.png": 9,
    "cards/9.4.png": 9,
    "cards/10.1.png": 10,
    "cards/10.2.png": 10,
    "cards/10.3.png": 10,
    "cards/10.4.png": 10,
    "cards/J1.png": 10,
    "cards/J2.png": 10,
    "cards/J3.png": 10,
    "cards/J4.png": 10,
    "cards/Q1.png": 10,
    "cards/Q2.png": 10,
    "cards/Q3.png": 10,
    "cards/Q4.png": 10,
    "cards/K1.png": 10,
    "cards/K2.png": 10,
    "cards/K3.png": 10,
    "cards/K4.png": 10,
    "cards/A1.png": 11,
    "cards/A2.png": 11,
    "cards/A3.png": 11,
    "cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};

  @override
  void initState() {
    super.initState();

    playingCards.addAll(deckOfCards);
  }

  void changeCards() {
    setState(() {
      isGameStarted = true;
    });

    playingCards = {};
    playingCards.addAll(deckOfCards);

    myCards = [];
    dealersCards = [];

    Random random = Random();

    String cardOneKey = playingCards.keys.elementAt(
      random.nextInt(playingCards.length),
    ); //from 1 t playingCards.length inclusive

    //Making sure cards are unique and remoove cardOneKey from playingCards
    playingCards.removeWhere((key, value) => key == cardOneKey);

    String cardTwoKey = playingCards.keys.elementAt(
      random.nextInt(playingCards.length),
    );
    playingCards.removeWhere((key, value) => key == cardTwoKey);

    String cardThreeKey = playingCards.keys.elementAt(
      random.nextInt(playingCards.length),
    );
    playingCards.removeWhere((key, value) => key == cardThreeKey);

    String cardFourKey = playingCards.keys.elementAt(
      random.nextInt(playingCards.length),
    );
    playingCards.removeWhere((key, value) => key == cardFourKey);

    dealersFirsCards = cardOneKey;
    dealersSecondCards = cardTwoKey;

    playerFirsCards = cardThreeKey;
    playerSecondCards = cardFourKey;

    dealersCards.add(Image.asset(dealersFirsCards!));
    dealersCards.add(Image.asset(dealersSecondCards!));

    dealerScore =
        deckOfCards[dealersFirsCards]! + deckOfCards[dealersFirsCards]!;

    myCards.add(Image.asset(playerFirsCards!));
    myCards.add(Image.asset(playerSecondCards!));

    playerScore =
        deckOfCards[playerFirsCards]! + deckOfCards[playerSecondCards]!;

    if (dealerScore <= 14) {
      String thirDealersCardKey = playingCards.keys.elementAt(
        random.nextInt(playingCards.length),
      );
      playingCards.removeWhere((key, value) => key == thirDealersCardKey);

      dealersCards.add(Image.asset(thirDealersCardKey));

      dealerScore = dealerScore + deckOfCards[thirDealersCardKey]!;
    }
  }

  void addCard() {
    Random random = Random();

    if (playingCards.length > 0) {
      String cardKey = playingCards.keys.elementAt(
        random.nextInt(playingCards.length),
      );
      playingCards.removeWhere((key, value) => key == cardKey);

      setState(() {
        myCards.add(Image.asset(cardKey));
      });
      playerScore = playerScore + deckOfCards[cardKey]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isGameStarted == true
          ? SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    //Dealers Cards
                    Column(
                      children: [
                        Text(
                          'Dealers score $dealerScore',
                          style: TextStyle(
                            color: dealerScore <= 21
                                ? Colors.green[900]
                                : Colors.red[900],
                          ),
                        ),

                        SizedBox(height: 20),
                        //Grid View
                        CardsGridView(cards: dealersCards),
                      ],
                    ),
                    //Players Cards
                    Column(
                      children: [
                        Text(
                          'Players score $playerScore',
                          style: TextStyle(
                            color: playerScore <= 21
                                ? Colors.green[900]
                                : Colors.red[900],
                          ),
                        ),
                        SizedBox(height: 20),

                        //Grid View
                        CardsGridView(cards: myCards),
                      ],
                    ),
                    // 2 Buttons
                    IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyButtton(onPressed: addCard, label: 'Another Card'),
                          MyButtton(
                            onPressed: changeCards,
                            label: 'Next Roound',
                          ),
                          // MaterialButton(
                          //   child: Text('Another Card'),
                          //   color: Colors.brown[200],
                          //   onPressed: addCard,
                          // ),
                          // MaterialButton(
                          //   child: Text('Next Roound'),
                          //   color: Colors.brown[200],

                          //   onPressed: changeCards,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: MyButtton(onPressed: changeCards, label: 'Start Game'),
            ),
    );
  }
}
