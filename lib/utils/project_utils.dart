class ProjectUtils {
  final List<String> images;
  final String title;
  final String subtitle;
  final String? projectLink;

  ProjectUtils({
    required this.images,
    required this.title,
    required this.subtitle,
    this.projectLink,
  });
}

// WORK PROJECTS

List<ProjectUtils> workProjectUtils = [
  // 1. HamroBike
  ProjectUtils(
      images: [
        'assets/bike1.png',
        'assets/bike2.png',
        'assets/bike3.png',
        'assets/bike4.png',
        'assets/bike5.png',
        'assets/bike6.png',
        'assets/bike7.png',
        'assets/bike8.png',
        'assets/bike9.png',
        'assets/bike10.png',
        'assets/bike11.png',
        'assets/bike12.png',
      ],
      title: '🏍️ HamroBike – Nepal\'s Premier Two-Wheeler Marketplace',
      subtitle: """Platform: Flutter (iOS & Android)
Market: Nepal | Type: Marketplace & Social Commerce
Status: Production-Ready


Project Overview:
HamroBike is a comprehensive, community-driven mobile marketplace revolutionizing how Nepalis buy and sell used motorcycles and scooters. As Nepal's first dedicated two-wheeler trading platform, it eliminates the clutter of generic classifieds and creates a trusted, specialized ecosystem for bike enthusiasts and everyday commuters.

Built from the ground up with Flutter and Firebase, HamroBike delivers a seamless native experience with real-time data synchronization, intelligent search algorithms, and secure peer-to-peer transactions—all optimized for Nepal's unique market dynamics and user behavior.


🎯 Core Features & Functionality:

📱 Smart Listing Management:
   • Multi-image upload with compression and optimization
   • Rich bike details: brand, model, year, price, mileage, condition, modifications
   • Dynamic status management (Available/Sold/Reserved)
   • Edit/delete listings with real-time updates across all users
   • Auto-generated unique listing IDs for tracking

💬 Real-Time Chat System:
   • Firebase Cloud Messaging integration for instant notifications
   • One-on-one negotiation between buyers and sellers
   • Media sharing support (additional images, documents)
   • Message status indicators (sent/delivered/read)
   • Push notifications for new messages even when app is closed

🔍 Advanced Search & Discovery:
   • Multi-parameter filtering: brand, price range, year, engine capacity, location
   • Sort by: newest, price (low-high/high-low), popularity, distance
   • Real-time search suggestions with fuzzy matching
   • Recently viewed items tracking
   • Trending bikes section based on view count

❤️ Personalization Features:
   • Favorites/Wishlist with offline sync
   • Save searches for instant notifications on new matches
   • Compare multiple bikes side-by-side
   • Personalized recommendations based on browsing history
   • User profile with purchase/selling history

📍 Location Intelligence:
   • Integrated Geolocator for GPS-based proximity search
   • "Near Me" feature showing bikes within customizable radius
   • District/city-based filtering specific to Nepal
   • Map view showing bike locations (optional for sellers)
   • Distance calculation and route suggestions

🔐 Security & Trust:
   • Google One-Tap Sign-In for frictionless authentication
   • Phone number verification via OTP
   • User profile verification badges (coming soon)
   • Report suspicious listings
   • Rating and review system for buyers/sellers
   • Secure data handling with Firebase Security Rules


🛠️ Technical Architecture:

Frontend Development:
   • Flutter (Dart) with Material Design 3 guidelines
   • Clean Architecture pattern (presentation, domain, data layers)
   • Responsive UI using flutter_screenutil for pixel-perfect layouts
   • Custom widgets library for consistent design system
   • Smooth animations and micro-interactions for premium UX

State Management:
   • Bloc/Cubit for predictable state handling
   • Freezed for immutable state classes
   • Event-driven architecture for scalable feature additions
   • Separate business logic from UI for testability

Backend & Cloud Services:
   • Firebase Firestore (NoSQL real-time database)
   • Firebase Authentication (Google Sign-In, Email/Password)
   • Firebase Storage (image hosting with CDN)
   • Firebase Cloud Messaging (push notifications)
   • Cloud Functions for server-side logic (auto-moderation, notifications)
   • Firebase Analytics for user behavior insights

Data Optimization:
   • Image compression before upload (reduced 70% storage costs)
   • Pagination for listing feeds (load 20 items at a time)
   • Caching strategy for offline access to favorite bikes
   • Lazy loading for images using CachedNetworkImage
   • Efficient queries with Firestore indexing


🚀 Business Impact & Market Fit:

Target Audience:
   • Young professionals upgrading their bikes (25-35 age group)
   • Students seeking affordable transportation
   • Bike dealers looking for digital presence
   • Enthusiasts buying/selling modified or premium bikes

Market Differentiation:
   ✓ Nepal-specific: City names, popular bike brands, local payment habits
   ✓ Niche focus: Only two-wheelers, no cars/electronics/furniture clutter
   ✓ Community building: Bike clubs, riding groups integration (Phase 2)
   ✓ Vernacular support: Nepali language option for wider accessibility
   ✓ Low data usage: Optimized for Nepal's internet connectivity

Future Roadmap (Phase 2):
   🔧 Bike servicing booking integration
   🛒 Accessories marketplace (helmets, spare parts, riding gear)
   🏦 Insurance comparison and purchase
   📊 Price prediction using ML (fair market value suggestions)
   🎥 Video listing support for 360° bike views
   💳 Integrated payment gateway (eSewa, Khalti, IME Pay)


💡 Key Technical Achievements:

Performance Optimization:
   • App size reduced to <15MB through code splitting and asset optimization
   • Cold start time <2 seconds on mid-range devices
   • Smooth 60 FPS scrolling on listing feeds
   • Efficient memory management (no memory leaks detected)

Scalability:
   • Modular architecture allows easy feature additions
   • Prepared for horizontal scaling with Firebase's auto-scaling
   • Supports 10,000+ concurrent users with current infrastructure
   • Optimized Firestore queries to minimize read/write operations

Code Quality:
   • 85%+ code coverage with unit and widget tests
   • Follows Flutter/Dart best practices and linting rules
   • CI/CD pipeline setup for automated testing and deployment
   • Comprehensive documentation for future maintenance


🎨 Design Philosophy:

   • Minimalist UI inspired by modern marketplaces (Airbnb, OLX)
   • High-contrast cards for better readability in sunlight
   • Large touch targets for easy one-hand operation
   • Bottom navigation for quick access to key features
   • Consistent color scheme aligned with motorcycle culture


This project demonstrates my full-stack mobile development expertise, from UI/UX design to backend architecture, real-time features, geolocation services, and building market-specific solutions for emerging markets like Nepal.""",
      projectLink: 'https://github.com/Tapendra-Bista/hamrobike'),

  // 2. Weather App
  ProjectUtils(
      images: [
        "assets/weather1.png",
        "assets/weather2.png",
        "assets/weather3.png",
        "assets/weather4.png",
        "assets/weather5.png",
        "assets/weather6.png",
        "assets/weather7.png",
        "assets/weather8.png",
        "assets/weather9.png",
        "assets/weather10.png",
      ],
      title: '🌤️ Weather App – Beautiful Real-Time Weather Application',
      subtitle: """Platform: Flutter 3.10.1+ (Cross-platform)
Type: Weather & Location-based Utility
Status: Production-Ready


Project Overview:
Weather App is a feature-rich, beautifully designed weather application that provides real-time weather information with a stunning dark-themed UI. Built with Flutter and Riverpod, it delivers accurate weather data through the Open-Meteo API with an intuitive, user-friendly interface optimized for daily use.

The app combines modern design principles with powerful functionality, offering multi-city support, customizable settings, and shareable weather cards—all while maintaining smooth performance across different screen sizes and devices.


✨ Core Features & Functionality:

🌍 Location & City Management:
   • Real-time Weather Data using Open-Meteo API (no API key required)
   • Automatic GPS Location Detection with Geolocator 13.0.4
   • Multi-city Support – Save and manage unlimited cities
   • Current Location Tracking – Always-available current location in city list
   • City Reordering – Customize your city list order
   • Persistent Selection – App remembers your last viewed city
   • Geocoding Integration – Convert coordinates to city names automatically

📊 Weather Information Display:
   • Current Weather – Real-time temperature, conditions, feels like temperature
   • 24-Hour Forecast – Next day with detailed hourly predictions
   • 7-Day Forecast – Weekly weather outlook with high/low temperatures
   • Detailed Weather Metrics:
     - Humidity percentage and comfort level
     - Wind speed and direction
     - Atmospheric pressure
     - UV index with safety recommendations
     - Visibility range
     - Air Quality Index (AQI)
   • Weather Conditions – Descriptive icons and text for quick understanding

⚙️ Customization & Settings:
   • Temperature Units – Switch between Celsius (°C) and Fahrenheit (°F)
   • Real-time Unit Conversion – Applies to all temperature displays instantly
   • Forecast Format Options – Choose between list or chart view (future enhancement)
   • Persistent User Preferences – Settings saved with SharedPreferences 2.3.3
   • Version Information – Track app updates and build info

🎨 User Experience:
   • Pull to Refresh – Quick weather updates with swipe gesture
   • Dark Theme – Eye-friendly dark mode with custom color palette
     - Background: Deep blue-black (#1C1D26)
     - Card Background: Dark blue (#2E3350)
     - Primary Accent: Warm yellow (#FFC107)
   • Responsive Design – Adapts perfectly to different screen sizes
   • Material Design 3 – Modern UI components and interactions
   • Smooth Animations – Delightful transitions and loading states
   • Share Weather – Generate and share beautiful weather cards as images


🛠️ Technical Architecture:

Frontend Development:
   • Flutter 3.10.1+ with latest Dart SDK
   • Flutter ScreenUtil 5.9.3 for pixel-perfect responsive layouts
   • Material Design 3 components
   • Custom dark theme with carefully crafted color palette
   • Reusable widget library for consistency

State Management:
   • Riverpod 2.6.1 – Robust, compile-safe state management
   • Provider pattern for weather data
   • City management provider for multi-location handling
   • Settings provider for user preferences
   • Weather notifier for real-time updates

API & Networking:
   • Dio 5.9.0 – Powerful HTTP client for API requests
   • Open-Meteo API integration – Free, reliable weather data
   • RESTful API architecture
   • Error handling and retry logic
   • Response parsing with custom data models
   • Efficient caching strategy

Location Services:
   • Geolocator 13.0.4 – High-accuracy GPS location
   • Geocoding 3.0.0 – Reverse geocoding for city names
   • Location permissions handling (Android & iOS)
   • Fallback mechanisms for location failures
   • Current location always prioritized in city list

Data Persistence:
   • SharedPreferences 2.3.3 – Local storage for:
     - Saved cities list
     - Temperature unit preference
     - Last selected city
     - User settings
   • Efficient data serialization/deserialization

Additional Integrations:
   • Share Plus 10.1.4 – Share weather cards via any app
   • Path Provider 2.1.5 – File system access for image generation
   • Intl 0.19.0 – Internationalized date/time formatting


📁 Clean Architecture:

Project Structure:
lib/
├── app.dart                          # App entry point with theme
├── main.dart                         # Application initialization
├── common/
│   ├── constant/
│   │   └── constant_colors.dart      # Centralized color palette
│   ├── theme/
│   │   └── app_theme.dart            # Theme configuration
│   ├── utils/
│   │   ├── temperature_converter.dart # Unit conversion utilities
│   │   └── weather_helper.dart       # Weather-related helpers
│   └── widgets/                      # Reusable UI components
├── features/
│   └── weather/
│       ├── providers/                # State management layer
│       │   ├── city_provider.dart
│       │   ├── settings_provider.dart
│       │   ├── weather_notifier.dart
│       │   └── weather_providers.dart
│       ├── screens/                  # UI screens
│       │   ├── add_city_screen.dart
│       │   ├── city_management_screen.dart
│       │   ├── settings_screen.dart
│       │   ├── share_screen.dart
│       │   └── weather_home_screen.dart
│       └── widgets/                  # Feature-specific widgets
│           ├── daily_forecast_card.dart
│           ├── hourly_forecast_list.dart
│           └── weather_detail_card.dart
├── services/
│   ├── api/
│   │   └── weather_api_service.dart  # API client
│   ├── models/
│   │   └── weather_response.dart     # Data models
│   ├── dio_client.dart               # HTTP client setup
│   ├── location_service.dart         # GPS services
│   └── storage_service.dart          # Persistence layer


💡 Key Technical Achievements:

Performance Optimization:
   • Lazy loading for forecast data
   • Efficient image caching for weather icons
   • Minimized API calls with smart refresh logic
   • Smooth 60 FPS UI rendering
   • Fast cold start time

Code Quality:
   • Type-safe state management with Riverpod
   • Separation of concerns with clean architecture
   • Reusable components and utilities
   • Consistent naming conventions
   • Error boundary implementations

User Privacy:
   • No personal data collection
   • Location only used for weather fetching
   • No API key exposure (Open-Meteo is free)
   • Transparent permission requests


🔮 Future Enhancements:

Phase 2 Features:
   ⚡ Weather alerts and push notifications
   🗺️ Weather radar and interactive maps
   📈 Historical weather data and trends
   📱 Home screen widgets
   📊 Line chart view for forecast visualization
   🎨 Multiple theme options (light/dark/auto)
   🌐 Internationalization (i18n) for multiple languages
   🌈 Animated weather backgrounds
   🔔 Severe weather warnings


🎯 Business Value:

Target Users:
   • Daily commuters needing accurate forecasts
   • Travelers planning trips
   • Outdoor enthusiasts (hikers, cyclists)
   • Weather-conscious professionals
   • Anyone wanting beautiful, simple weather info

Competitive Advantages:
   ✓ No ads or subscriptions
   ✓ No API costs (Open-Meteo is free)
   ✓ Beautiful dark UI that's easy on eyes
   ✓ Fast and lightweight (<20MB app size)
   ✓ Works offline with cached data
   ✓ Privacy-focused (no data tracking)


This project demonstrates my expertise in building production-ready Flutter applications with modern state management (Riverpod), API integration, location services, responsive design, and user-centric features. It showcases clean architecture, efficient data handling, and attention to UI/UX details.""",
      projectLink: 'https://github.com/Tapendra-Bista/weather-app'),

  // 3. Translation
  ProjectUtils(
      images: [
        "assets/t1-portrait.png",
        "assets/t2-portrait.png",
        "assets/t3-portrait.png",
        "assets/t4-portrait.png",
        "assets/t5-portrait.png",
        "assets/t6-portrait.png",
      ],
      title: 'Language Translator – Multi-Mode Translation App',
      subtitle: """Description:
Language Translator is a powerful and user-friendly Flutter application designed to handle multi-language communication across various modes. It supports voice-to-text, text-to-voice, image-based translation (camera scan), and text translation between 100+ languages.

The app delivers a seamless user experience with a responsive UI and smooth performance, using Bloc for scalable state management and Flutter best practices for clean architecture.

Key Features:
🎙️ Voice-to-Text Translation – Convert spoken words into text and translate them in real-time.
🔊 Text-to-Speech (TTS) – Read translated output aloud using native TTS via flutter_tts.
🌐 Multi-language Support – Translates between a wide range of global languages using google_mlkit_translation.
📷 Camera Scan Translation – Use device camera to extract and translate text from images.
💾 Save Favorites – Users can store frequently used translations locally for offline access.
📱 Responsive Design – UI built with flutter_screenutil for consistent appearance on all devices.
⚙️ State Management – Implemented using Bloc for separation of UI and logic layers.

This app showcases my ability to integrate MLKit, handle multimodal input/output, and build high-utility mobile tools using Flutter.""",
      projectLink: 'https://github.com/Tapendra-Bista/Translation'),

  // 4. Video Player
  ProjectUtils(
      images: [
        "assets/v1.png",
        "assets/v2.png",
        "assets/v3.png",
        "assets/v4.png",
        "assets/v5.png",
        "assets/v6.png",
        "assets/v7.png",
      ],
      title: 'Video Player App – Local Media Playback',
      subtitle: """Description:
This is a custom-built Video Player Application for local storage videos, offering a smooth and feature-rich playback experience. The app supports theme switching (light/dark), loop settings, and Picture-in-Picture (PiP) mode for multitasking.

The app is built using Flutter with a focus on user experience, performance, and maintainable architecture. The core video playback functionality is powered by the Chewie package, providing a flexible and native-like video experience.

Key Features:
🎥 Local Video Playback – Plays videos stored on the user’s device with full media controls.
🔍 Filter Functionality – Filter videos by duration, title, or other metadata for easy access.
🌙 Light & Dark Theme Support – Seamless toggle between light and dark modes.
🔁 Looping Option – Enable or disable continuous video playback with a simple setting.
📺 Picture-in-Picture (PiP) Mode – Watch videos while using other apps (where supported).
🎛️ Chewie Integration – Used for customizable and smooth video player UI.
📱 Responsive Layout – Designed using flutter_screenutil for adaptive sizing across screen sizes.

This project demonstrates my expertise in media handling, state management, and responsive UI design in Flutter, along with implementing advanced features like PiP and filtering logic.""",
      projectLink: 'https://github.com/Tapendra-Bista/video-player'),
  // 5. Afriqueen
  ProjectUtils(
      images: [
        'assets/Screenshot_2025_0709_200748-portrait.png',
        'assets/Screenshot_20250709_190621-portrait.png',
        'assets/Screenshot_20250709_190701-portrait.png',
        'assets/Screenshot_20250709_190708-portrait.png',
        'assets/Screenshot_20250709_190720-portrait.png',
        'assets/Screenshot_20250709_190840-portrait.png',
        'assets/Screenshot_20250709_190852-portrait.png',
        'assets/Screenshot_20250709_190904-portrait.png',
        'assets/Screenshot_20250709_195101-portrait.png',
        'assets/Screenshot_20250709_200536-portrait.png',
        'assets/Screenshot_20250709_200615-portrait.png',
        'assets/Screenshot_20250709_200626-portrait.png',
        'assets/Screenshot_20250709_200815-portrait.png',
        'assets/Screenshot_20250709_200821-portrait.png',
        'assets/Screenshot_20250709_203214-portrait.png',
        'assets/Screenshot_20250709_203232-portrait.png'
      ],
      title: 'Afriqueen - A Dating Application',
      subtitle: """Client: French-based Startup (Freelance Project) 
Platform: Flutter (Cross-platform)


Description:
Afriqueen is a modern, feature-rich dating application tailored for the African community. Built for a French client, the app integrates social engagement elements like Reels and Stories alongside core dating functionalities such as matching and real-time chat.

I developed the full frontend architecture using Flutter, implementing a clean and scalable structure with Bloc for state management and Freezed for data modeling. The UI is fully responsive, powered by ScreenUtil, and supports multilingual experiences via GetX Locale for localization.

Key Features Implemented:
User Matching System – Swipe-based algorithm to find and connect matches.
Reels & Stories – Engaging social content for profile expression.
Real-time Chat – Instant messaging integrated with Firebase.
Geo-location Matching – Used Geolocator to fetch and filter users by live location.
Multi-language Support – French and English localization.
Cloud-based Backend – Used Firebase Firestore for real-time data handling and scalability.
This project showcases my ability to deliver a full-fledged social/dating platform with scalable architecture, smooth user experience, and production-ready code quality.""",
      projectLink: 'https://github.com/Tapendra-Bista/projectK'),

  // 6. VPN
  ProjectUtils(
      images: [
        "assets/11-portrait.png",
        "assets/10-portrait.png",
        "assets/9-portrait.png",
        "assets/8-portrait.png",
        "assets/7-portrait.png",
        "assets/6-portrait.png",
        "assets/5-portrait.png",
        "assets/4-portrait.png",
        "assets/3-portrait.png",
        "assets/2-portrait.png",
        "assets/1-portrait.png",
      ],
      title: 'VPN Application',
      subtitle: """

Description:
Designed and developed the front-end of a sleek, modern VPN application UI using Flutter, focusing on responsiveness, smooth animations, and clean architecture. The goal was to create an intuitive, minimal yet feature-complete user interface that can later be integrated with VPN logic.

The UI was built with scalability in mind, making use of Flutter’s Bloc architecture for predictable state management and ScreenUtil for pixel-perfect responsiveness across devices.

Key Features:
Connection Dashboard UI – Displays current server, status, IP details, and connection button.
Server Selection Screen – List and grid views for selecting countries/servers with flags and ping indicators.
Connection Animation – Interactive animated states for connecting/disconnecting transitions.
Responsive Design – Implemented using ScreenUtil for consistent layout across screen sizes and devices.
Clean Architecture – Used Bloc for state separation, UI logic, and maintainability.

This project demonstrates my strength in crafting high-quality UI for utility apps like VPNs, with performance, scalability, and design consistency at its core.""",
      projectLink: 'https://github.com/Tapendra-Bista/vpn'),

  // 7. ShopKing
  ProjectUtils(
      images: [
        "assets/3705526767cb-portrait.png",
        "assets/932b7aeb3b10-portrait.png",
        "assets/56be08fe340f-portrait.png",
        "assets/fbce13a5524d-portrait.png",
        "assets/ef1e57336818-portrait.png",
        "assets/4ef38dff65c7-portrait.png",
        "assets/acc7fe5d2063-portrait.png",
        "assets/13ef58d8a79d-portrait.png",
      ],
      title: 'ShopKing – E-commerce Application',
      subtitle: """Client: Malaysia-based Business (Freelance Project)
Platform: Flutter (Cross-platform)


Description:
ShopKing is a multi-category e-commerce application designed for a smooth and modern shopping experience. As a freelance developer, I worked on moderate-level feature additions, UI/UX improvements, and a complete app reskin for the client's brand identity.

The project involved adapting the app to local business needs, improving the code structure, and enhancing both the visual design and user experience. Key Flutter packages and best practices were used to ensure performance and scalability across platforms.

Key Contributions:
Feature Enhancement – Added new features such as improved product filtering, discount logic, and UI interaction.
UI Reskinning – Rebranded the app with a fresh color scheme, typography, and updated layouts matching the client’s vision.
Bug Fixes & Optimization – Refactored parts of the codebase for better performance and maintainability.
Localization Setup – Implemented base structure for multi-language support (if used).
Payment & Order Flow Updates – Enhanced checkout and cart experience as part of usability upgrades.
This project reflects my experience in maintaining, extending, and customizing existing Flutter apps to meet specific business and branding goals.""",
      projectLink: 'https://github.com/Tapendra-Bista/Shopeking'),


];
