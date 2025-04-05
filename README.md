# Problema de Lógica em Prolog: As Meninas do Recital

Este projeto implementa, em Prolog, a solução de um clássico problema de lógica envolvendo cinco meninas que aguardam para recitar um poema. Cada menina possui características únicas — nome, cor do vestido, poeta favorito, idade, animal preferido e suco preferido — e uma série de dicas é usada para deduzir a posição correta de cada uma.

## Descrição do Problema

Cinco meninas estão lado a lado esperando para recitar um poema. A partir de diversas pistas (como "a menina com vestido amarelo está à esquerda da que gosta de pássaros"), o objetivo é descobrir a configuração completa de características de cada menina.

## Características das Meninas

Cada menina tem os seguintes atributos:

- **Nome:** Giovanna, Janaina, Luana, Marcia, Simone  
- **Vestido:** Amarelo, Azul, Branco, Verde, Vermelho  
- **Poeta Favorito:** Drummond, Guimarães Rosa, Olavo Bilac, Mário de Andrade, Vinicius de Moraes  
- **Idade:** 8, 9, 10, 11, 12  
- **Animal Preferido:** Cachorros, Cavalos, Gatos, Pássaros, Tartarugas  
- **Suco Preferido:** Laranja, Limão, Manga, Maracujá, Uva  

## Estratégia de Solução

A solução é composta por:

- **Declaração de fatos:** Define os possíveis valores para cada categoria.
- **Regras auxiliares:** Funções como `aoLado/3`, `aDireita/3`, `entre/4`, etc., ajudam a interpretar as pistas.
- **Validação de unicidade:** Todas as meninas devem ter características únicas.
- **Regras lógicas:** As pistas do enunciado foram traduzidas para cláusulas Prolog, compondo a lógica da solução.
- **Apresentação:** A solução é exibida como uma tabela.

## Arquivo principal

O código está no arquivo principal Prolog e pode ser executado em qualquer interpretador Prolog compatível com o padrão ISO, como SWI-Prolog.

## Como Executar

1. Instale o [SWI-Prolog](https://www.swi-prolog.org/Download.html)
2. Abra o terminal e carregue o arquivo:
   ```prolog
   ?- [arquivo]. % substitua "arquivo" pelo nome do seu arquivo
   ```
3. Execute o predicado principal:
   ```prolog
   ?- solucao(Lista), mostrarTabela(Lista).
   ```

Isso exibirá a solução no terminal, com cada linha representando uma menina e suas respectivas características.

## Exemplos de Regras Usadas

- `aDireita(X,Y,L)` — Verifica se `X` está à direita de `Y` na lista `L`
- `aoLado(X,Y,L)` — Verifica se `X` está imediatamente ao lado de `Y`
- `entre(X,Y,Z,L)` — Verifica se `X` está entre `Y` e `Z` na lista `L`
- `todosDiferentes(Lista)` — Garante que todos os elementos de `Lista` sejam distintos

## Objetivo

Este projeto é ideal para praticar:

- Resolução de problemas de lógica em Prolog
- Manipulação de listas e relacionamentos posicionais
- Representação de conhecimento lógico e dedução

## Exemplo de Saída

```text
giovanna vermelho vinicius_de_moraes 10 tartarugas laranja
janaina amarelo olavo_bilac 8 cavalos manga
luana branco drummond 11 gatos limao
marcia azul mario_de_andrade 9 cachorros uva
simone verde guimaraes_rosa 12 passaros maracuja
```

## 🔗 Fonte

Este problema foi adaptado do site [Racha Cuca - Recital de Poesia](https://rachacuca.com.br/logica/problemas/recital-de-poesia/).
