# Getting Started

This project is that verified the complex differences in handling of state when combining flutter with hooks or riverpod with actual working code.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Pages

About what is verified on each page of this project.

### with_annotation / without_annotation

I implemented both patterns because it seems that the application implementation method differs greatly depending on whether riverpod_annotation(riverpod_generator) is used or not.

### stateful_page

- A page realized with the most basic StatefulWidget/State class in flutter.
- You should not implement your program this way unless necessary. This is the old way.

### flutter_hooks_page

- Page implemented using flutter_hooks

### flutter_riverpod_page

- Page implemented using flutter_riverpod

### hooks_riverpod_page

- Page implemented using hooks_riverpod_page
- It's a little complicated because this library requires parts implemented by both riverpod/hooks.

### riverpod_list_page

- Since most of the operations on the list of Model are performed in the actual application, the implementation was also verified.


## Libraries

Description of the libraries used in this project

### Annotations

Several annotations are used in this project. Dart source code is automatically generated from annotations such as @freezed and @riverpod. If you want to regenerate them the trees that you run the command below.

>  flutter pub run build_runner watch --delete-conflicting-outputs

### Hooks

Hooks is a Hook library for Flutter (Dart) inspired by React's Hooks.

https://github.com/rrousselGit/flutter_hooks

### Riverpod

Riverpod is a state notification library reimplemented by the author of flutter_hooks with the Provider design pattern.

https://riverpod.dev/docs/getting_started


## [License: MIT](LICENSE.md)
