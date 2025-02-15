function [X_train, y_train, X_pred, y_pred] = split_dataset (X, y, percentage)
  # TO DO: împarte setul de date în 2 seturi: 
  # un set de training si un set de test,
  # ambele reprezentate printr-o matrice de features un vector de clase
  # percentage este un parametru considerat intre 0 si 1
  
  # Fiecare linie a matricii X reprezinta x^{(i)} si fiecare element de pe
  # linia coloanei y reprezinta y^{(i)}
  [m n] = size(X);
  a = percentage * m;
  a = round(a);
  X_train = X(1:a, :);
  y_train = y(1:a, :);

  X_pred = X(a + 1 : m, :);
  y_pred = y(a + 1 : m, :);

endfunction
