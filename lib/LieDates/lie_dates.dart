import 'package:flutter/material.dart';

class Model {
  String UserName;
  List<ModelMessageList> MessageList;
  String icon;
  bool CheckBoxb;
  String Tlf;
  String Description;

  Model({
    @required this.UserName = "User Default",
    @required this.MessageList,
    @required this.icon,
    @required this.CheckBoxb = false,
    @required this.Tlf = "+380502177620",
    @required this.Description = "Режиссер из Сан-Франциско."
  });
}

class ModelMessageList {
  String Message;
  String Who;
  String SendingTime;

  ModelMessageList({
    @required this.Message,
    @required this.Who = "he",
    @required this.SendingTime,
  });
}

class Mocks {
  Mocks._();

  static List<Model> model = [
    Model(
      UserName: "1XBet",
      Description: "Промо страничка сайта 1XBet. Заходи и выигрывай вместе с нами!!!",
      MessageList: [
        ModelMessageList(
          Message: "Давай, ждем, брат!",
          SendingTime: "15:38",
        ),
        ModelMessageList(
          Message: "Ага, пасеб, может когда то зайду",
          Who: "",
          SendingTime: "15:36",
        ),
        ModelMessageList(
          Message: "Промокод: GHVDH34H8",
          SendingTime: "14:41",
        ),
        ModelMessageList(
          Message: "На сайте есть крутое обучение, заходи, не переживай, все будет клёво!",
          SendingTime: "14:40",
        ),
        ModelMessageList(
          Message: "Но я не умею играть, я все проиграю...",
          Who: "",
          SendingTime: "14:38",
        ),
        ModelMessageList(
          Message: "ВЫИГРЫВАЙ ВМЕСТЕ С НАМИ!!!",
          SendingTime: "14:36",
        ),
        ModelMessageList(
          Message: "СТАВКИ НА СПОРТ!!! БОЛЬШИЕ ВЫИГРАШИ!!! АДИН ИКС БЕТ!!! БЭНГ БЭНГ!!!",
          SendingTime: "14:33",
        ),
      ],
      icon: "images/bet.png",
    ),
    Model(
      UserName: "Коллектор",
      MessageList: [
        ModelMessageList(
          Message: "Ты должен денег, когда вернешь????",
          SendingTime: "14:36",
        ),
        ModelMessageList(
          Message: "Ало, я у твоего дома, выноси бабло",
          SendingTime: "16:39",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Nikola",
      MessageList: [
        ModelMessageList(
          Message: "С++ уроки бесплатно, записывайся к нам на курс!",
          SendingTime: "13:33",
        ),
      ],
      icon: "images/kate.png",
    ),
    Model(
      UserName: "Alex",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Alex",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Patrick",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Снежанна",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Юрец",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Валера",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Коллектор",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
    Model(
      UserName: "Миша",
      MessageList: [
        ModelMessageList(
          Message: "",
          SendingTime: "",
        ),
      ],
      icon: "images/g.jpg",
    ),
  ];
}
