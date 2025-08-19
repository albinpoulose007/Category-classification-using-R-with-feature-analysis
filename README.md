# Category-classification-using-R-with-feature-analysis
Category classification using R with feature analysis, cross-validation, and real-world simulation datasets.


# Category Classification – BUAN 6333 Project  

## 📌 Project Overview  
This project was developed as part of **BUAN 6333: Foundations of Programming for Business Analytics** at The University of Texas at Dallas.  
Our objective was to simulate a real-world client request where companies propose data analysis tools for category classification. We designed three classifiers (`B_Classifier`, `C_Classifier`, and `O_Classifier`) in **R** that assign categories to numeric inputs and vectors.  

The tasks included:  
- Building supervised ML models for classification.  
- Analyzing data characteristics (linear vs. non-linear).  
- Applying appropriate algorithms (Logistic Regression, ElasticNet, Random Forest, etc.).  
- Evaluating performance using cross-validation and accuracy metrics.  

---

## 👨‍👩‍👧‍👦 Team Members  
- Brieuc Lunven  
- Yuyu Chebon Ndiema  
- **Albin Poulose**  
- Hiral Yadav  
- Ling Zhang  

---

## ⚙️ Classifiers Implemented  

### 🔹 **B_Classifier**  
- **Input:** Single numeric value (`dataset_bx.csv`).  
- **Output:** Class type → `bn` or `bo`.  
- **Approach:** Logistic Regression (data linearly separable).  

### 🔹 **C_Classifier**  
- **Input:** Vector of numeric values (`cx.csv`).  
- **Output:** Vector of class labels (`cb` or `cw`).  
- **Approach:** Logistic Regression / SVM / KNN (linearly separable data).  

### 🔹 **O_Classifier**  
- **Input:** 8-feature numeric vector (`dataset_ox.csv`).  
- **Output:** Class label → `o0` to `o9`.  
- **Approach:** Elastic Net (Ridge + Lasso), Random Forest (to handle overlapping and non-linear distribution).  

---

## 📊 Data Analysis & Algorithms  
- Visualized datasets using scatter plots, boxplots, histograms, and pair plots.  
- Observed linear separability for `B` and `C` classifiers → Logistic Regression was effective.  
- `O_Classifier` had overlapping data distributions → ElasticNet & Random Forest performed better.  
- **Cross-validation** was applied to avoid overfitting and improve generalization.  

---

## ✅ Results & Evaluation  
- **B_Classifier & C_Classifier** achieved **high accuracy** using Logistic Regression.  
- **O_Classifier** achieved the best performance using ElasticNet (regularization handled complexity of 8 features).  
- Testing confirmed consistent classification across provided datasets.  

---

## 💡 Key Learnings  
- Hands-on experience with R classification models.  
- Importance of **feature analysis** before selecting algorithms.  
- Value of **cross-validation** in model selection.  
- Collaboration and peer evaluation with other project groups gave diverse perspectives and improved our code quality.  

---

## 📂 Repository Structure  
