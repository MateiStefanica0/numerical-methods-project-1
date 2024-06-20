function [x] = conjugate_gradient (A, b, x0, tol, max_iter) 
  # Implementati algoritmul pentru metoda gradientului conjugat
  r_anterior = b - A * x0;
  v = r_anterior;
  x = x0;
  tol_sq = tol ^ 2;
  k = 1;
  while k <= max_iter && r_anterior'*r_anterior > tol_sq
    t = (r_anterior'*r_anterior) / (v'*A *v);
    x = x + t * v;
    r_curent = r_anterior - t * A * v;
    s = (r_curent'*r_curent)/(r_anterior'*r_anterior);
    v = r_curent + s * v;
    k = k + 1;
    r_anterior = r_curent;
  endwhile
endfunction