function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    % build the stochastic matrix. Bonus if it is sparse
    % The 'stochastic' matrix SHOULD NOT be scaled (divided by sum of all)
    % It should just be entry-wise
    % This is how the checker tests it, to not have to deal with floating point errors    
    widx = word_idx(words_set);
    kscvidx = k_secv_idx(k_secv_set);
    
    wk = widx.keys; % words -> keys
    wv = widx.values; % words -> values
    kk = kscvidx.keys; % k secv -> keys
    kv = kscvidx.values; %k secv -> values
    
    %values = numere
    %keys = litere
    
    [irelevant m] = size(kv); % cate linii are matricea
    [irelevant n] = size(wv); % cate coloane are matricea
    retval = zeros(length(kv), length(wv));
    
    for i = 1 : length(k_secv_corpus);
      feature = k_secv_corpus{i};
      index_feature = kscvidx(feature);
      index_next_word = i + k;
      next_word = corpus_words{index_next_word};
      index_label = widx(next_word);
      retval(index_feature, index_label) = retval(index_feature, index_label) + 1;
    endfor
    
    retval = sparse(retval);
endfunction
