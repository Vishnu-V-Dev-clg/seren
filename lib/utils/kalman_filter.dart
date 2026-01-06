class KalmanFilter {
  // Noise parameters (tunable)
  double q; // Process noise
  double r; // Measurement noise

  // State variables
  double x; // Estimated GSR
  double p; // Error covariance
  double k; // Kalman gain

  bool initialized = false;

  KalmanFilter({this.q = 0.01, this.r = 2.0}) : x = 0.0, p = 1.0, k = 0.0;

  double filter(double measurement) {
    // Initialize with first measurement
    if (!initialized) {
      x = measurement;
      initialized = true;
      return x;
    }

    // 1. Prediction step
    p = p + q;

    // 2. Measurement update
    k = p / (p + r);
    x = x + k * (measurement - x);
    p = (1 - k) * p;

    return x;
  }

  /// Normalization (as mentioned in the paper)
  double normalize(double value, {double min = 0, double max = 500}) {
    return ((value - min) / (max - min)) * 500;
  }
}
