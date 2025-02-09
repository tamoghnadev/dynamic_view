Dynamic Homepage Flutter Application
Project Description

This Flutter application dynamically renders a homepage UI based on API responses. It integrates with a specified API endpoint to fetch the structure and content of the homepage, including components like banners, categories, and product lists. The application is designed to handle dynamic sequences of UI components as defined by the API, ensuring a flexible and up-to-date user interface.
Getting Started

This guide will walk you through setting up and running the Flutter application on your local machine.

Prerequisites:

Before you begin, ensure you have the following installed:

    Flutter SDK: Make sure you have Flutter installed and configured on your system. You can download it from flutter.dev.
    Dart SDK: Dart comes bundled with Flutter, so you don't need to install it separately.
    Android Studio or VS Code with Flutter and Dart plugins: Choose your preferred IDE for Flutter development. Android Studio or VS Code are recommended.
    Emulator or Physical Device: You'll need either an Android emulator, iOS simulator, or a physical device to run the application.

Installation Steps:

    Clone the repository:

    If you haven't already, clone the project repository to your local machine using Git:
    Bash

git clone https://github.com/tamoghnadev/dynamic_view.git
cd your_app_name

Get dependencies:

Navigate to the project directory in your terminal and run the following command to fetch all the required dependencies specified in pubspec.yaml:
Bash

    flutter pub get

    This command will download all packages listed under the dependencies section in your pubspec.yaml file.

Running the Application

Running on Android Emulator or Device:

    Ensure your Android emulator is running or your Android device is connected and in developer mode.

    In your terminal, navigate to the project directory.

    Run the application using the Flutter CLI:
    Bash

    flutter run android

    This command will build the application for Android and install it on your connected emulator or device.

Running on iOS Simulator or Device:

    Ensure your iOS simulator is running or your iOS device is connected and trusted.

    If running on iOS for the first time, you might need to navigate to the ios directory and run pod install:
    Bash

cd ios
pod install
cd .. # Go back to the project root

This step is necessary to install CocoaPods dependencies for iOS if it's a new project setup or dependencies have changed.

In your terminal, navigate to the project directory.

Run the application using the Flutter CLI:
Bash

    flutter run ios

    This command will build the application for iOS and install it on your running simulator or connected device.

Running Tests:

To run the unit tests for the Bloc logic, use the following command in your project directory:
Bash

flutter test test/bloc/homepage_bloc_test.dart

This will execute the test cases located in the specified test file and provide you with the test results in the terminal.
Project Structure

your_app_name/
├── lib/
│   ├── api/                      # API service related files
│   │   └── api_service.dart
│   ├── bloc/                     # Bloc for state management
│   │   ├── homepage_bloc.dart
│   │   ├── homepage_event.dart
│   │   └── homepage_state.dart
│   ├── data/                     # Data models for API responses
│   │   └── data_models.dart
│   ├── ui/                       # User interface components
│   │   ├── screens/              # Application screens
│   │   │   └── homepage_screen.dart
│   │   └── widgets/              # Reusable UI widgets
│   │       ├── category_list_widget.dart
│   │       └── product_list_widget.dart
│   │       ├── banner_widget.dart
│   │       └── seller_list_widget.dart
│   ├── service_locator.dart      # Dependency Injection setup
│   └── main.dart                 # Entry point of the application
├── test/
│   └── bloc/                 # Bloc test files
│       └── homepage_bloc_test.dart
├── pubspec.yaml                # Project dependencies and configuration
└── README.md                   # Project documentation (this file)

Key Dependencies

    flutter_bloc: For state management, implementing the Bloc pattern.
    dio: For making HTTP requests to the API with authentication and error handling.
    get_it: For Dependency Injection, managing service and bloc instances.

You can find the specific versions of these and other dependencies in the pubspec.yaml file.
Assumptions

    API Availability: It is assumed that the provided API endpoint (https://food.56testing.club/Api/Api_customer/homepage_dynamic) is always accessible and returns data in the expected JSON format as demonstrated in the project description.
    Basic Authentication: The application uses Basic Authentication with username food123 and password food123 as provided. These credentials are assumed to be valid for accessing the API.
    Data Models: Data models (Category, Product, HomepageComponent, HomepageBanner) are created based on the example API response structure. It's assumed that the API response structure remains consistent.
    Widget Reusability: Widgets like CategoryListWidget, ProductListWidget, BannerWidget, and SellerListWidget are designed to be reusable and adaptable based on the data provided by the API.
    Error Handling: Basic error handling is implemented for API calls and state management, including displaying error messages and loading indicators.

Evaluation Criteria

This application is developed considering the following evaluation criteria:

    Code Quality: Clean, modular, and well-documented code.
    Dependency Injection: Proper DI setup for services and components using GetIt.
    State Management: Effective use of Bloc to manage states and UI updates.
    Dynamic Rendering: Accurate rendering of the UI based on the API response.
    Error Handling: Robust error handling for API calls and state management.
    Testing: Coverage of Bloc logic with unit tests.
    UI/UX: Responsiveness and visual clarity of the application.
