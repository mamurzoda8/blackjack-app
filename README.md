# 🃏 Blackjack — Flutter App

> 🎯 A simple, clean, and fun implementation of the classic **Blackjack (21)** card game built using **Flutter**.  
> Modular, readable, and beginner-friendly — ideal for learning card game logic and Flutter UI design.

---

## ✨ Features

- 🎮 Start or restart a new game
- 🔀 Random card dealing from a full deck
- ♠️ Cards do not repeat during a round
- 👤 Player can draw more cards
- 🤖 Dealer draws third card if score ≤ 14
- 💯 Real-time score tracking
- 🚫 Bust alert if score exceeds 21
- 🧼 Clean, modular and maintainable code structure

---

## 📸 Screenshots (Recommended)

> Include images such as:
> - 🟩 Initial game screen
> - 🃏 Cards dealt to player and dealer
> - 🟥 Dealer bust example

---

## 📂 Project Structure

```

lib/
├── widgets/
│   ├── cards\_grid\_view\.dart     # Widget to show cards in grid
│   └── my\_button.dart           # Reusable styled button
│
├── homepage.dart                # Game logic and UI layout
├── consts.dart                  # Constants (colors, styles, etc.)
└── main.dart                    # Entry point of the Flutter app

assets/
└── cards/                       # Image assets for all cards

pubspec.yaml                    # Flutter config and asset declaration

````

---

## 🧠 Game Logic

### 🃏 Deck of Cards

- The full deck is stored as a `Map<String, int>`
  - Keys: paths to card images (e.g., `"cards/2.1.png"`)
  - Values: card scores (2–10, J/Q/K = 10, A = 11)

### 🎲 Dealing Cards

- At game start, 2 random cards are dealt to:
  - The player
  - The dealer
- Dealer draws a third card **only if** their total score is ≤ 14
- Used cards are removed from the deck to avoid repeats

### 🧮 Score Tracking

- Scores are calculated by summing card values
- If score > 21 → text turns red (bust)
- Scores are updated live on the UI

### 🕹️ Gameplay Flow

- `Start Game`: initializes and deals cards
- `Another Card`: lets the player draw a new card
- `Next Round`: resets the game state and re-deals cards

---

## 🛠️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/back_jack_app.git
cd back_jack_app
````

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 📦 Dependencies

This project uses only the **core Flutter SDK**.

Make sure you declare your assets in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/cards/
```

---

## 🎨 UI & Code Style

* 🧱 Code split into reusable widgets
* 🎨 Consistent styles and constants in `consts.dart`
* 📦 Separation of logic and UI for maintainability
* ✅ Stateless and stateful widgets used appropriately

---

## 💡 Future Improvements

* 🏆 Win/loss message after each round
* 💰 Simple betting or chip system
* 🎵 Add sound effects for card dealing
* 📲 Add animations for card draw
* 🌙 Dark mode support
* 🌐 Multi-language support (localization)

---

## 🙋‍♂️ About the Developer

**Mustafo Mamurzoda**

> Made with ❤️ using Flutter

---

## 📃 License

This project is licensed under the [MIT License](LICENSE).

---

## 🔗 Useful Links

* [Flutter Documentation](https://flutter.dev/docs)
* [Dart Language Guide](https://dart.dev/guides)
* [GitHub Markdown Guide](https://guides.github.com/features/mastering-markdown/)

```


