Task 1
    estimate_gaussian:
        - am calculat vectorul medie, care are fiecare element i, media aritmetica a tuturor elementelor de pe linia i din X
        - am calculat matricea de varianta, asa cum este definita in enuntul temei
    multivariate_gaussian:
        - pentru fiecare vector linie din X, am calculat valoara functiei de probabilitati, asa cum este definita in enuntul temei
    check_predictions:
        - am parcurs vectorii predictions si truths si i-am comparat element cu element, incrementand una dintre cele trei valori pe parcurs
    metrics:
        - am calculat valorile precision, recall si F1 pentru parametrii primiti
    optimal_threshold:
        - voi cauta cel mai bun epsilon intre minimul si maximul din probabilities; pentru a face asta, l-am sortat si am luat prima si ultima valoare; pasul de iterare va fi diferenta dintre acestea, impartita la 1000
        - pentru fiecare epsilon incercat, calculez vectorul de pribabilitati si valoarea variabilei total_pozitives, apoi pe baza lor calculez valorile precision, recall si F1 si in functie de F1 actualizez, daca e cazul, epsilonul cel mai bun


Task 2
    linear_kernel, polynomial_kernel, gaussian_kernel:
        - am implementat functiile, folosind formulele din enuntul temei
    spil_dataset:
        - impart valorile din X si y in cate doua, folosind valoarea percentage
    build_kernel:
        - apelez functia de kernel primita ca parametru pentru liniile din X
    cholesky:
        - am folosit codul din laborator, pe care l-am factorizat
    get_lower_inverse:
        - algoritmul are la baza eliminarea gaussiana invatata la algaed
        - am creat o matrice identitate de dimensiunile lui L, pe care am "lipit-o" la sfarsitul matricei L
        - apoi am facut eliminare gaussiana (am folosit ca pivoti elementele de pe diagonala principala), in matricea veche rezultand o matrice diagonala, iar in matricea identitate "lipita" la inceput rezultand inversa lui L
        - in acest moment am in L atat matricea diagonala, cat si inversa, asa ca am pus in P, doar a doua jumatate, adica inversa pe care trebuia sa o calculez
    get_prediction_params:
        - am aplicat formula din enuntul temei
        - pentru a face asta a trebuit sa inversez matricea, asa ca am folosit factorizarea Cholesky, apoi am inversat matricea L, iar inversa primei matrici este produsul dintre L_inv transpus si L_inv
    conjugate_gradient:
        - am aplicat algoritmul din enuntul temei, folosind 2 variabile separate pentru r la pasul k-1 si r la pasul k
    get_prediction_params_iterative:
        - am calculat inversa matricei, dupa ce am rescris ecuatia pentru a putea folosi conjugate gradient, facnd sistemul
        Ax = b, unde A este matricea construita, x este vectorul a ce trebuie aflat, iar y este y * lambda
        - am folosit toleranta de 0.001 si maxiter de 1000 pentru a obtine un rezultat cat mai precis, dar fara a dura prea mult
        executia
    eval_value:
        - am aplicat formula din enuntul temei penru toate liniile lui X

Task 3
    distinct_words:
        - am folosit functia unique, care sorteaza elementele si elimina duplicatele
    k_secv:
        - creez C un cell_array vid
        - iterez prin A, si creez un cell_aray cu cate k cuvinte, pe care apoi il adaug in C
        - mut in B, valoarea lui C transpus, pentru a se potrivi cu modul in care asteapta checkerul outputul
        - elimin din B ultima linie
    distinct_k_secv:
        - idem distinct_words
    word_idx:
        - creez un dictionar folosind containers.Map, in care cheile sunt de tip char, iar valorile de tip int
        - il populez cu valorile din distinct_wds
    k_secv_idx:
        - idem word_idx
    stochastic_matrix:
        - creez dictionarele si scot cheile si valorile din ele
        - initializez matricea
        - parcurg multimea secventelor si pentru fiecare secventa in parte patrez in index_feature indexul sau din dictionar
        - apoi calculez indexul cuvantului care poate urma din multimea cuvintelor
        - aflu indexul respectivului cuvant din dictionarul de cuvinte, si incrementez valoarea corespunzatoare din matrice
        - fac matricea sa fie matrice rara 
