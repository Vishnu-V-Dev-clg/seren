# SEREN – Stress Detection Application Using GSR

SEREN is a Flutter-based application developed to demonstrate stress detection using Galvanic Skin Response (GSR) values. The application simulates physiological data using manual inputs and applies a Kalman Filter to improve signal accuracy. This version of the project is intended for early-stage testing and academic evaluation prior to hardware integration.

---

## 1. Introduction

Stress is a physiological and psychological condition that can be quantified using bio-signals such as Galvanic Skin Response (GSR). GSR measures changes in skin conductivity caused by sweat gland activity, which is closely linked to stress levels.

SEREN provides a software-based prototype that:

* Simulates GSR readings
* Filters noisy data using a Kalman Filter
* Classifies stress levels based on normalized GSR values

---

## 2. Project Objectives

* To simulate GSR sensor data using manual user input
* To apply Kalman filtering for noise reduction
* To classify stress levels using predefined thresholds
* To develop a clean and understandable UI for academic demonstration

---

## 3. Stress Classification Criteria

Stress levels are classified based on normalized GSR values as follows:

| Normalized GSR Value | Stress Level     |
| -------------------- | ---------------- |
| GSR ≤ 200            | No Stress        |
| 200 < GSR ≤ 300      | Moderate Stress  |
| 300 < GSR ≤ 400      | High Stress      |
| GSR > 400            | Very High Stress |

---

## 4. Kalman Filter Implementation

A one-dimensional Kalman Filter is used to smooth the GSR signal. The filter reduces sudden fluctuations and measurement noise by estimating the true signal value over multiple inputs.

Key characteristics:

* The first input initializes the filter state
* Subsequent inputs refine the estimate
* Output becomes smoother as more data is processed

This approach closely resembles real-world physiological signal processing.

---

## 5. Multi-Input Testing Approach

To simulate time-varying GSR data:

* Multiple GSR values are entered manually
* Each value is processed sequentially through the Kalman Filter
* The final filtered value is used for stress classification

This allows observation of how stress levels change as input values vary.

---

## Application Screenshots

### Very High Stress
![Very High Stress](screenshots/Screenshot%202026-01-07%20001203.png)


### High Stress
![ High Stress](screenshots/Screenshot%202026-01-07%20001134.png)

### Moderate Stress
![Moderate Stress](screenshots/Screenshot%202026-01-07%20001116.png)

### No Stress
![No Stress](screenshots/Screenshot%202026-01-07%20001055.png)

---

## 7. Technologies Used

* Flutter
* Dart
* Material Design
* Kalman Filter (signal processing)

---

## 8. Current Project Status

* Manual GSR input testing completed
* Kalman filtering logic implemented
* Stress classification functioning correctly
* Hardware integration pending

---

## 9. Future Scope

* Integration with real GSR sensors
* Continuous real-time data acquisition
* Graph-based visualization of GSR signals
* Mobile device deployment
* Cloud-based data storage

---

## 10. Conclusion

SEREN successfully demonstrates the feasibility of stress detection using GSR values and Kalman filtering in a controlled, software-only environment. The project provides a strong foundation for future enhancements involving real-time hardware-based stress monitoring systems.

---

## 11. Author

Developed as a college mini project for academic evaluation.

---

## 12. License

This project is intended for educational and research purposes only.

