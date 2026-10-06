# RentHub (PropertyRenting)

An iOS rental app built with SwiftUI and Firebase. 

## About

RentHub connects tenants with rental listings. Anyone can browse properties as a guest. Users can also create an account as a tenant or a landlord, and each role gets its own home screen after login.

## Main features

- Browse and search rental listings as a guest, with no login needed
- Register and log in with email and password (Firebase Authentication)
- Role-based screens for tenants and landlords

## Tech stack

- Swift, SwiftUI
- Firebase Authentication
- Cloud Firestore
- Swift Package Manager

## Setup

1. Clone this repo and open `PropertyRenting-Group2.xcodeproj` in Xcode.
2. Add your own `GoogleService-Info.plist` to the inner `PropertyRenting-Group2` folder (the same folder as `ContentView.swift`). Download it from your Firebase project settings. This file is not in the repo.
3. In your Firebase project, turn on Email/Password sign-in and create a Cloud Firestore database.
4. Build and run.
