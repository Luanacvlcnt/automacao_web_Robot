*** Settings ***
Documentation    Essa suite testa o site da Amazon.con.br
Resource         amazon_resources.robot
Suite Setup      Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***

Caso de Testes 01- Acesso ao menu "Eletrônicos"
   [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
   ...                e verifica a categoria Computadores e Informática      
   [Tags]             menus  categoria         
       Dado que estou na home page da Amazon.com.br
       Quando acessar o menu "Eletrônicos"
       Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
       E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
       E a categoria "Computadores e Informática" deve ser exibida na página



       


Caso de Teste 02- Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto    
    [Tags]             busca_produtos  lista_busca
        Dado que estou na home page da Amazon.com.br
        Quando pesquisar pelo produto "Xbox Series S"
        Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        E um produto da linha "Xbox Series S" deve ser mostrado na página


#GHERKIN STEPS 

Dado que estou na home page da Amazon.com.br 
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."


Quando acessar o menu "Eletrônicos"
    






  
 
   