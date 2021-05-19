# Evaluating Differentially Private Machine Learning in Practice


This repository has been adopted from https://github.com/bargavj/EvaluatingDPML.

Code to reproduce the original results is present in the directory `reproduction_of_results`. 
Implementation of the alternate target model architecture to reduce generalization
gap has been done in the script `classifier.py`. Training, performance comparison,
and Yeom's membership attack on the proposed as well as the original model has 
been presented in `notebooks/explore.ipynb`.

### Requirements

- Python 2.7 or higher (https://www.anaconda.com/distribution/)
- Tensorflow (https://www.tensorflow.org/install)
- Tensorflow Privacy (https://github.com/tensorflow/privacy)

### Pre-processing data sets

Pre-processed CIFAR-100 data set has been provided in the `dataset/` folder. Purchase-100 data set can be downloaded from [Kaggle web site](https://www.kaggle.com/c/acquire-valued-shoppers-challenge/data). This can be pre-processed using the preprocess_purchase.py scipt provided in the repository. Alternatively, the files for Purchase-100 data set can be found [here](https://drive.google.com/open?id=1nDDr8OWRaliIrUZcZ-0I8sEB2WqAXdKZ).
For pre-processing other data sets, bound the L2 norm of each record to 1 and pickle the features and labels separately into `$dataset`_feature.p and `$dataset`_labels.p files in the `dataset/` folder (where `$dataset` is a placeholder for the data set file name, e.g. for Purchase-100 data set, `$dataset` will be purchase_100).

### Results
Successfully improved performance in foiling Yeom's membership attack as compared to author's original implementation by constructing a more generalized target model. Attack model that was successful in original implementation (Precision = 0.92) was ineffective against the improved target model (Precision = 0.55).
