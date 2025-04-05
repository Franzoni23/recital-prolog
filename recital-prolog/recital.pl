% Problema de Lógica: Cinco meninas aguardam lado a lado para recitar um poema no recital.

% Declaração de fatos: possíveis valores para cada característica das meninas.

vestido(amarelo).
vestido(azul).
vestido(branco).
vestido(verde).
vestido(vermelho).

nome(giovanna).
nome(janaina).
nome(luana).
nome(marcia).
nome(simone).

poeta(drummond).
poeta(guimaraes_rosa).
poeta(olavo_bilac).
poeta(mario_de_andrade).
poeta(vinicius_de_moraes).

idade(8).
idade(9).
idade(10).
idade(11).
idade(12).

animal(cachorros).
animal(cavalos).
animal(gatos).
animal(passaros).
animal(tartarugas).

suco(laranja).
suco(limao).
suco(manga).
suco(maracuja).
suco(uva).

% Regras para posições na lista.

% X está ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
% X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), nth0(IndexY,Lista,Y), IndexX < IndexY.
                        
% X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

% X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X); Lista = [X|_].

% X está entre Y e Z.
entre(X, Y, Z, Lista) :- 
    nth0(IndexX, Lista, X),
    nth0(IndexY, Lista, Y),
    nth0(IndexZ, Lista, Z),
    IndexY < IndexX, IndexX < IndexZ.

% Todas as meninas devem ser diferentes em seus atributos.

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H, T)), todosDiferentes(T).

% A solução para o problema.
solucao(ListaSolucao) :- 
    ListaSolucao = [
        menina(Nome1, Vestido1, Poeta1, Idade1, Animal1, Suco1),
        menina(Nome2, Vestido2, Poeta2, Idade2, Animal2, Suco2),
        menina(Nome3, Vestido3, Poeta3, Idade3, Animal3, Suco3),
        menina(Nome4, Vestido4, Poeta4, Idade4, Animal4, Suco4),
        menina(Nome5, Vestido5, Poeta5, Idade5, Animal5, Suco5)
    ],

    % Aplicando as dicas:

    noCanto(menina(_, _, _, _, _, maracuja),ListaSolucao),
    aEsquerda(menina(_, amarelo, _, _, _, _), menina(_, _, _, _, passaros, _),ListaSolucao),
    aEsquerda(menina(_, _, _, 8, _, _), menina(_, _, drummond, _, _, _),ListaSolucao),
    Poeta1 = guimaraes_rosa,
    member(menina(_, verde, _, 9, _, _),ListaSolucao),
    nextto(menina(_, _, _, _, _, laranja), menina(_, _, drummond, _, _, _),ListaSolucao),
    aDireita(menina(marcia, _, _, _, _, _), menina(_, branco, _, _, _, _),ListaSolucao),
    Animal4 = gatos,
    entre(menina(_, amarelo, _, _, _, _), menina(_, _, _, _, cavalos, _), menina(giovanna, _, _, _, _, _),ListaSolucao),
    nextto(menina(_, _, _, _, _, uva), menina(_, azul, _, _, _, _),ListaSolucao),
    aEsquerda(menina(_, verde, _, _, _, _), menina(simone, _, _, _, _, _),ListaSolucao),
    aoLado(menina(_, amarelo, _, _, _, _), menina(_, _, _, _, tartarugas, _),ListaSolucao),
    Suco2 = limao,
    aEsquerda(menina(_, amarelo, _, _, _, _), menina(_, _, _, _, _, uva),ListaSolucao),
    noCanto(menina(_, _, _, 12, _, _),ListaSolucao),
    aoLado(menina(_, _, _, _, _, limao), menina(_, _, _, _, _, manga),ListaSolucao),
    nextto(menina(_, verde, _, _, _, _), menina(_, _, _, 11, _, _),ListaSolucao),
    aEsquerda(menina(_, vermelho, _, _, _, _), menina(_, _, vinicius_de_moraes, _, _, _),ListaSolucao),
    aoLado(menina(_, _, _, _, gatos, _), menina(_, _, _, 8, _, _),ListaSolucao),
    aDireita(menina(_, _, olavo_bilac, _, _, _), menina(_, amarelo, _, _, _, _),ListaSolucao),
    entre(menina(giovanna, _, _, _, _, _), menina(_, _, guimaraes_rosa, _, _, _), menina(janaina, _, _, _, _, _),ListaSolucao),
    entre(menina(_, _, _, 9, _, _), menina(_, _, _, 10, _, _), menina(_, _, _, 11, _, _),ListaSolucao),

    % Garantindo que todas as características sejam diferentes
    vestido(Vestido1), vestido(Vestido2), vestido(Vestido3), vestido(Vestido4), vestido(Vestido5),
    todosDiferentes([Vestido1, Vestido2, Vestido3, Vestido4, Vestido5]),

    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    poeta(Poeta1), poeta(Poeta2), poeta(Poeta3), poeta(Poeta4), poeta(Poeta5),
    todosDiferentes([Poeta1, Poeta2, Poeta3, Poeta4, Poeta5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    animal(Animal1), animal(Animal2), animal(Animal3), animal(Animal4), animal(Animal5),
    todosDiferentes([Animal1, Animal2, Animal3, Animal4, Animal5]),

    suco(Suco1), suco(Suco2), suco(Suco3), suco(Suco4), suco(Suco5),
    todosDiferentes([Suco1, Suco2, Suco3, Suco4, Suco5]).

% Mostra a solução em formato de tabela
mostrarTabela([]).
mostrarTabela([menina(Nome, Vestido, Poeta, Idade, Animal, Suco)|Rest]) :-
    format('~w ~w ~w ~w ~w ~w~n', [Nome, Vestido, Poeta, Idade, Animal, Suco]),
    mostrarTabela(Rest).

% Para executar
?- solucao(Lista), mostrarTabela(Lista).
