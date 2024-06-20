function retval = word_idx (distinct_wds)
    % Return the inverted word_idx dictionary where keys are words and values are indices
    retval = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    for i = 1:length(distinct_wds)
        retval(distinct_wds{i}) = i;
    endfor
endfunction
