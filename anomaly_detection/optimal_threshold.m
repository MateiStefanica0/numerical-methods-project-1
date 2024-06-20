% Finds the best threshold to use for selecting outliers.
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
  probabilities_sorted = sort(probabilities);
  % sortez vectorul de probabilities pentru a ii afla mai usor minimul si maximul,
  % iar apoi il caut pe cel mai bun epsilon intre ele cu 1000 de pasi
  min = probabilities_sorted(1);
  len = length(probabilities);
  max = probabilities_sorted(len);
  best_epsilon = 0;
  best_F1 = 0;
  associated_precision = 0;
  associated_recall = 0;

  % pasul cu care se face cautarea
  step = (max - min) / 1000;

  for i = 1 : 1000
    epsilon = min + i * step;
    % calculez pentru fiecare epsilon un vector de predictii pe care apoi sa 
    % il folosesc pentru a calcula false_pozitives, false_negatives si true_pozitives
    % pentru a calcula recall, precision si F1
    % totodata, calculez si valaorea de total_pozitives
    predictions = zeros(len, 1);
    total_pozitives = 0;
    for j = 1 : len
      if probabilities(j) < epsilon
        total_pozitives = total_pozitives + 1;
        predictions(j) = 1;
      endif
    endfor
    [false_pozitives, false_negatives, true_pozitives] = check_predictions(predictions, truths);
    if true_pozitives + false_pozitives != 0 && true_pozitives + false_negatives != 0
      [precision recall F1] = metrics(true_pozitives, false_pozitives, false_negatives)
       
    else
      continue
    endif
    % daca sunt la prima iteratie a forului, primul epsilon devine si cel mai bun, pana cand
    % gasesc altul
    if i == 1
      best_epsilon = epsilon;
      best_F1 = F1;
      associated_precision = precision;
      associated_recall = recall;
    endif
    % daca gasesc un epsilon care are F1 mai mare decat actualul cel mai bun epsilon, il inlocuiesc
    if F1 > best_F1
      best_epsilon = epsilon;
      best_F1 = F1;
      associated_precision = precision;
      associated_recall = recall;
    endif
  endfor
    
endfunction
