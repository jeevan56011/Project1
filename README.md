---
title: Sign Language Detection
emoji: 🤟
colorFrom: blue
colorTo: indigo
sdk: docker
app_port: 7860
pinned: false
---

# Sign Language Detection & Recognition System

An end-to-end Computer Vision and Web application designed to recognize and translate sign language in real-time. Built using **Flask** for the web interface, **YOLOv8** (You Only Look Once) for object detection, and **SQLite** for user authentication and management.

---

## 🚀 Key Features

*   **User Authentication System:** Secure registration and login portals backed by an SQLite database.
*   **Real-time Webcam Detection:** Real-time stream processing that captures webcam input and displays YOLOv8 class bounding boxes with confidence scores.
*   **Media Upload Analysis:**
    *   **Image Detection:** Upload images (`.jpg`, `.png`, etc.) to run detection on them and view annotated outputs.
    *   **Video Translation:** Upload videos (`.mp4`, `.avi`, `.mov`) which are processed frame-by-frame and re-encoded using FFmpeg for native web playback.
*   **Model Analytics Dashboard:** Visual performance metric tracking showing accuracy, validation benchmarks, and precision-recall graphs.

---

## 📂 Project Architecture

```plaintext
├── SIGN_LANGUAGE_MAIN_CODE/
│   ├── app.py                      # Main Flask application server & API routes
│   ├── run.py                      # Standalone camera-test scripts
│   ├── best.pt                     # Custom-trained YOLOv8 weights (Sign Language)
│   ├── yolov8n.pt                  # YOLOv8 nano pre-trained base model weights
│   ├── data.yaml                   # Dataset configuration files (classes, names)
│   ├── templates/                  # HTML views (home, camera, login, signup, etc.)
│   ├── static/                     # Web assets (CSS stylesheets, JS, results plots)
│   └── README.roboflow.txt         # Dataset export details
├── .gitignore                      # Git exclusion rules
├── requirements.txt                # Python package dependencies
└── README.md                       # Documentation
```

---

## 🛠️ System Prerequisites & Installation

### Prerequisites
*   **Python:** Version `3.8` to `3.11` recommended.
*   **FFmpeg:** Required on the host OS for video processing and proper Web-H.264 video rendering.

### Installation Steps

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/jeevan56011/Project1.git
    cd Project1
    ```

2.  **Set Up a Virtual Environment (Recommended):**
    ```bash
    # Windows
    python -m venv venv
    .\venv\Scripts\activate

    # macOS/Linux
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Install Required Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

---

## 💻 Running the Application

1.  Navigate into the source directory:
    ```bash
    cd SIGN_LANGUAGE_MAIN_CODE
    ```

2.  Launch the Flask development server:
    ```bash
    python app.py
    ```

3.  Open your browser and navigate to:
    ```http
    http://127.0.0.1:5000/
    ```

---

## 📊 Model Evaluation & Metrics

The custom-trained YOLOv8 sign language translation model has been evaluated on the Roboflow dataset. The following analytics (saved in the `SIGN_LANGUAGE_MAIN_CODE/static/images/` directory) highlight the model's training performance:

*   **F1-Curve (`F1_curve.png`):** Shows the balance between precision and recall across confidence thresholds.
*   **Precision-Recall Curve (`PR_curve.png`):** Evaluates overall class detection metrics.
*   **Confusion Matrix (`confusion_matrix.png`):** Highlights class-specific true positives versus false predictions.

---

## 🔧 Troubleshooting

### OSError: [WinError 126] (Failed to load PyTorch DLLs)
This is a common issue on Windows when running PyTorch inside a virtual environment created from the **Microsoft Store version of Python**, or when the **Microsoft Visual C++ Redistributable** is missing.

**Solutions:**
1. **Install Microsoft Visual C++ Redistributables:** Download and install the latest x64 redistributables from the [Official Microsoft Page](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist).
2. **Use python.org Installer (Recommended):** Uninstall the Microsoft Store Python version and download Python from [python.org](https://www.python.org/). This ensures your virtual environments have proper access to DLL paths.
3. **Manual DLL Fix (Fallback):** If you must use Microsoft Store Python, you can resolve the loading restrictions by copying `python311.dll` from your base python directory and `msvcp140_atomic_wait.dll` (found in `C:\Program Files\Common Files\microsoft shared\ClickToRun` or OneDrive folders) directly into your virtual environment's `venv\Lib\site-packages\torch\lib` folder.

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).

