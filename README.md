# Click Gift

An online gift store app built with Flutter and GetX. Shoppers browse gifts by category, choose a wrapping style, add a recipient and check out with cash on delivery or a card.

## Features

- Product catalogue with categories and product detail pages
- Cart and checkout with recipient name, address, wrapping style and payment method (cash on delivery or credit/debit card)
- Order confirmation screen
- Inquiry form with an optional photo from the camera or gallery
- Profile settings: dark mode, email and SMS notification toggles, logout
- Device-aware UX:
  - offline banner (`connectivity_plus`)
  - low battery warning (`battery_plus`)
  - delivery address from your current location (`geolocator`, `geocoding`)
- Login and registration with the session saved locally

## Tech stack

- **Flutter** (Dart) for Android and iOS
- **GetX** for state management, routing and dependency injection (a binding and controller per screen)
- `shared_preferences`, `connectivity_plus`, `battery_plus`, `geolocator`, `geocoding`, `image_picker`

## Project structure

```
lib/
  components/   reusable widgets and the app theme
  models/       user model
  routes/       GetX route table
  services/     auth service
  views/        cart, categories, checkout, dashboard, home, inquiries,
                login, product, profile, register (view + controller + binding)
```

## Getting started

```bash
flutter pub get
flutter run
```

Location, camera and gallery features ask for permission at runtime on the device.
