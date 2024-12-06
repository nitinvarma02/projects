## Type-2 Diabetes Risk Prediction: A Data-Driven Machine Learning Approach

## Overview
Diabetes is a chronic disease that occurs either when the pancreas does not produce enough insulin or when the body cannot effectively use the insulin it produces. Insulin is a hormone that regulates blood glucose. Hyperglycemia, also known as raised blood glucose, is a common effect of uncontrolled diabetes, leading to serious damage over time to many of the body's systems, especially the nerves and blood vessels.

The global burden of diabetes has been steadily rising. In 2022, 14% of adults aged 18 years and older were living with diabetes, doubling from 7% in 1990. More than half (59%) of adults aged 30 years and over with diabetes were not taking medication for their condition. Treatment coverage remains lowest in low- and middle-income countries. In 2021, diabetes directly caused 1.6 million deaths, with 47% of these deaths occurring before the age of 70. High blood glucose was also responsible for around 11% of cardiovascular deaths and over 530,000 kidney disease deaths.While global efforts to address other major noncommunicable diseases have seen success, mortality rates from diabetes have been increasing since 2000. These trends highlight the urgent need for effective tools for early detection and prevention of diabetes-related complications.(WHO)

This project aims to address this challenge using a data-driven approach. By analyzing healthcare statistics and lifestyle indicators, it leverages machine learning algorithms to predict Type-2 Diabetes risk. The models explored include Logistic Regression, K-Nearest Neighbors (KNN), Naïve Bayes, Support Vector Machines (SVM), and Random Forest. Through these methods, the project identifies key risk factors and provides insights into improving diabetes risk prediction, with the ultimate goal of aiding early detection and intervention strategies.

## Dataset
The project uses the **Diabetes Health Indicators Dataset** sourced from the [https://archive.ics.uci.edu/dataset/891/cdc+diabetes+health+indicators] and CDC. This dataset contains healthcare statistics and lifestyle survey information about individuals diagnosed as diabetic or non-diabetic.

- **Number of Samples**: 230,000+
- **Number of Features**: 23
- **Target Variable**: `Diabetes_Binary` (1 for diabetic, 0 for non-diabetic)

### Key Attributes:
- **Demographics**: Age, Sex, Education, Income
- **Health Indicators**: BMI, High Blood Pressure (HighBP), High Cholesterol (HighChol)
- **Lifestyle Factors**: Smoking, Physical Activity, Heavy Alcohol Consumption
- **General Health**: Self-reported health status, Mental and Physical Health days

## Methods
To predict diabetes risk, the following machine learning models were applied:

1. **Logistic Regression**:
   - Interpretable binary classification model.
   - Accuracy: 85.94%.

2. **K-Nearest Neighbors (KNN)**:
   - Captures local data patterns effectively.
   - Accuracy: 86.09%.

3. **Naïve Bayes**:
   - Probabilistic classifier assuming feature independence.
   - Accuracy: 85.36%.

4. **Support Vector Machine (SVM)**:
   - Used with multiple kernels (Linear, Polynomial, RBF, Sigmoid).
   - Best kernel (RBF) accuracy: 86.08%.

5. **Random Forest**:
   - Ensemble model with decision trees.
   - Best performer with accuracy: 86.35%.

## Results

### Performance Metrics:
- **Best Model**: Random Forest (86.35% accuracy)
- Class Imbalance: Low recall for diabetic cases due to imbalanced dataset.

### Key Findings:
- Strong correlations between diabetes risk and features such as BMI, High Blood Pressure, and High Cholesterol.
- Non-linear models (e.g., SVM with RBF kernel) slightly outperformed linear ones.

**Recommendations**:
- Re-sampling to balance the class
- Use oversampling (e.g., SMOTE) to address class imbalance.
- Experiment with additional features or adjusted class weights to improve sensitivity for diabetic cases.



