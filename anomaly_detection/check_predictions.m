
function [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths)
  false_pozitives = 0;
  false_negatives = 0;
  true_pozitives = 0;
  len = length(predictions);
  for i = 1 : len
    if predictions(i) == 1
      if truths(i) == 1 
        % true_pozitives
        true_pozitives = true_pozitives + 1;
      else
        % false positives
        false_pozitives = false_pozitives + 1;
      endif
    else
      if truths(i) == 1
        false_negatives = false_negatives + 1;
      endif
    endif
  endfor
endfunction