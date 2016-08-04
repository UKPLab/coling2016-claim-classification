# Claim classification - verifiableVsUnverifiable and FactualVsFeeling 
## Claim classification using CNN- and LSTM-based sentence representation

##Library Requirments
* python 2.7
* theano
* gensim - https://radimrehurek.com/gensim/install.html

## 1) sentence-level CNN
Yoon's [Convolutional Neural Networks for Sentence Classification](http://arxiv.org/abs/1408.5882) - An embedding layer followed by convolution layer.

## 2) sentence-level LSTM
Similar to model 1, concatenating an embedding layer with a LSTM-RNN module - http://deeplearning.net/tutorial/lstm.html#lstm

##Datasets
* Verifiable and Unverifiable claims dataset
* Factual and Feeling claims dataset

## Embeddings
*  Word2Vec - Mikalovs
*  Dependency embeddings - Omer levy et. al
*  Factual embeddings    - compiled from FactBank 1.0 corpus using Gensim
* concatenated embeddings - cocnatenate all three embeddings into stacked embeddings of 300 dimensional size
* Embeddings are placed in embeddings folder

## Preprocessing
### Preprocess datasets using different embeddings for CNN claim classification
### Run scripts as following for converting datasets into emebdding vectors/matrices
      python preprocess_data_verify.py ../embeddings/GoogleNews-vectors-negative300.bin   ../embeddings/deps.words ../embeddings/factual.en.word2vec.model.bin
      python preprocess_data_factfeel.py ../embeddings/Google..   ../embeddings/deps.words ../embeddings/factual.en..
      
* Creates embedding weight matrices and word dictionary in pickle format. 
* These files are generated in the current directory

### Preprocess datasets using different embeddings for LSTM claim classification
      python preprocess_data_verify.py ../embeddings/GoogleNews-vectors-negative300.bin   ../embeddings/deps.words ../embeddings/factual.en.word2vec.model.bin
      python preprocess_data_factfeel.py ../embeddings/Google..   ../embeddings/deps.words ../embeddings/factual.en..

* Creates embedding weight matrices and word dictionary in pickle format. 
* These files are generated in the current directory

## classification
## cnn based claim calssification -  running scripts to get predictions on 2 datasets
   1. verifiabile and Unverifiable dataset
        python conv_net_sentence_verify.py -word2vec  
        python conv_net_sentence_verify.py -dep2vec
        python conv_net_sentence_verify.py -fact2vec
        python conv_net_sentence_verify.py -concat

   2. factual and feel dataset  
        python conv_net_sentence_factfeel.py -word2vec
        python conv_net_sentence_factfeel.py -dep2vec
        python conv_net_sentence_factfeel.py -fact2vec
        python conv_net_sentence_factfeel.py -concat

## lstm based claim classification of 2 datasets 

   3. verifiabile and Unverifiable dataset
        python lstm_verify.py -word2vec
        python lstm_verify.py -dep2vec
        python lstm_verify.py -fact2vec
        python lstm_verify.py -concat

   4. factual and feel dataset
        python lstm_factfeel.py -word2vec
        python lstm_factfeel.py -dep2vec
        python lstm_factfeel.py -fact2vec
        python lstm_factfeel.py -concat


# Output
  * corresponding claim predictions with given embeddings will be stored in the predictions folder 
  * Accuracies will be reported in the commandline. Choose the best accuracy from iterations 
  * Ex: prediction file format - cnn_verifiability_word2vec_predictions.txt
    
