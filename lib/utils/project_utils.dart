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
  // Afriqueen
  ProjectUtils(
      images: [
        'Screenshot_2025_0709_200748-portrait.png',
        'Screenshot_20250709_190621-portrait.png',
        'Screenshot_20250709_190701-portrait.png',
        'Screenshot_20250709_190708-portrait.png',
        'Screenshot_20250709_190720-portrait.png',
        'Screenshot_20250709_190840-portrait.png',
        'Screenshot_20250709_190852-portrait.png',
        'Screenshot_20250709_190904-portrait.png',
        'Screenshot_20250709_195101-portrait.png',
        'Screenshot_20250709_200536-portrait.png',
        'Screenshot_20250709_200615-portrait.png',
        'Screenshot_20250709_200626-portrait.png',
        'Screenshot_20250709_200815-portrait.png',
        'Screenshot_20250709_200821-portrait.png',
        'Screenshot_20250709_203214-portrait.png',
        'Screenshot_20250709_203232-portrait.png'
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

  // Vpn
  ProjectUtils(
      images: [
        "11-portrait.png",
        "10-portrait.png",
        "9-portrait.png",
        "8-portrait.png",
        "7-portrait.png",
        "6-portrait.png",
        "5-portrait.png",
        "4-portrait.png",
        "3-portrait.png",
        "2-portrait.png",
        "1-portrait.png",
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

  // ShopKing
  ProjectUtils(
      images: [
        "3705526767cb-portrait.png",
        "932b7aeb3b10-portrait.png",
        "56be08fe340f-portrait.png",
        "fbce13a5524d-portrait.png",
        "ef1e57336818-portrait.png",
        "4ef38dff65c7-portrait.png",
        "acc7fe5d2063-portrait.png",
        "13ef58d8a79d-portrait.png",
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

  // translation
  ProjectUtils(
      images: [
        "t1-portrait.png",
        "t2-portrait.png",
        "t3-portrait.png",
        "t4-portrait.png",
        "t5-portrait.png",
        "t6-portrait.png",
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

  // translation
  ProjectUtils(
      images: [
        "v1.png",
        "v2.png",
        "v3.png",
        "v4.png",
        "v5.png",
        "v6.png",
        "v7.png",
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
];
