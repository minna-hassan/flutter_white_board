# 🎨 Flutter Drawing Board

A feature-rich drawing board application built with Flutter using `CustomPainter`, gesture detection, and canvas-based rendering.

The project explores Flutter's low-level rendering capabilities by implementing freehand drawing, geometric shapes, canvas transformations, and interactive drawing tools from scratch.

---

## 🎬 Preview

https://github.com/user-attachments/assets/b70924b1-0fc8-4203-b535-3b66027374b4

---

## 🧩 Project Structure


| File                               | Description                     |
| ---------------------------------- | ------------------------------- |
| `main.dart`                        | Application entry point         |
| `drawing_board_ui.dart`            | Main whiteboard interface       |
| `custom_painter.dart`              | Canvas rendering logic          |
| `drawing_elements_data.dart`       | Drawing element models and data |
| `tool_box.dart`                    | Drawing tools panel             |
| `tool_box_properties.dart`         | Tool settings and controls      |
| `change_shape_property.dart`       | Shape configuration options     |
| `change_stroke_size_property.dart` | Stroke thickness controls       |
| `colour_list.dart`                 | Color palette definitions       |
| `canvas_background.dart`           | Canvas grid rendering           |
| `custom_app_bar.dart`              | Application header and actions  |

---

## ✨ Features

### 🖌️ Freehand Drawing

* Smooth gesture-based drawing
* Adjustable stroke thickness
* Dynamic color selection

### 🔺 Shape Library

Draw geometric shapes directly on the canvas:

* Line
* Rectangle / Square
* Circle / Oval
* Triangle
* Pentagon
* Hexagon
* Star

### 🎨 Shape Customization

* Filled shapes
* Outlined shapes
* Custom stroke colors
* Adjustable border thickness

### 🎚️ Drawing Controls

* Color picker
* Stroke size controls
* Shape selection tools

### ↩️ History Management

* Undo actions
* Redo actions
* Clear entire canvas

### 🔍 Canvas Controls

* Zoom in
* Zoom out
* Scalable drawing experience

---

## 🎨 Canvas Rendering

The entire drawing system is powered by Flutter's `CustomPainter`.

Rendered elements include:

* Freehand strokes
* Geometric shapes
* Canvas grid background
* Dynamic drawing previews

Everything is drawn directly using Flutter's Canvas API without relying on external drawing packages.

---

## 🛠 Tech Stack

* Flutter
* Dart
* CustomPainter
* Canvas API
* GestureDetector
* Path API
* Matrix4 Transformations

---

## 🚀 Getting Started

Clone the repository:

```bash
git clone <your-repository-url>
```

Navigate to the project:

```bash
cd flutter-drawing-board
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 🧠 What I Learned

This project helped me gain hands-on experience with:

* Flutter's rendering pipeline
* CustomPainter and Canvas APIs
* Interactive drawing systems
* Shape generation using Path
* Gesture handling
* Canvas transformations
* State management for drawing applications

---

## 🎯 Future Improvements

* Text tool enhancements
* Eraser improvements
* Shape selection and movement
* Shape resizing
* Export canvas as image
* Additional whiteboard interactions

---

## ⭐ License

Free to use for learning and personal projects.

If you use this project or parts of it, credit is appreciated.
