*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}                  chrome
${URL}                      http://www.amazon.com.br
${MENU_ELETRONICOS}         //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${BOTAO_ADD_AO_CARRINHO}     add-to-cart-button 
${NAO_OBRIGADO}             //input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]
${ADICONADO_AO_CARRINHO}    //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${CARRINHO}                 nav-cart
${EXCLUIR}                 //input[contains(@value,'Excluir')]
${REMOVIDO_DO_CARRINHO}    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***

Abrir o navegador 
     Open Browser    browser=chrome
     Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}   

Verificar se aparece a frase "${FRASE}" 
    Wait Until Page Contains    text=${FRASE}  
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS} 


Verificar se o título da página fica "${TITULO}" 
    Title Should Be    title=${TITULO}
 
Verificar se aparece a categoria "${CATEGORIA_NOME}"
   Element Should Be Visible    locator=//a[contains(@aria-label,'')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button   

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=${BOTAO_ADD_AO_CARRINHO}  
    Click Button    locator=${BOTAO_ADD_AO_CARRINHO}
    Wait Until Element Is Visible    locator=${NAO_OBRIGADO}
    Click Button    locator=${NAO_OBRIGADO}
    


Verificar se o produto "${ADICIONAR_PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible   locator=productTitle

Clicar no botão ir para o carrinho
    Click Button    locator=//input[contains(@name,'submit.add-to-cart')]

    
Remover o produto "${REMOVER_PRODUTO}" do carrinho
    Click Button    locator=//input[contains(@name,'submit.delete.C4415116f-8551-429d-b798-855777b9c18a')]
    
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    

 # GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
       Acessar a home page do site Amazon.com.br
       Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."  
       
Quando acessar o menu "Eletrônicos"
       Entrar no menu "Eletrônicos"
       
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
       Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
       
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
       Verificar se aparece a frase "Eletrônicos e Tecnologia" 
       
E a categoria "Computadores e Informática" deve ser exibida na página
       Verificar se aparece a categoria "Computadores e Informática"
        
        
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
     Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

 Dado que adiciono o produto no carrinho de compras  
    Adicionar o produto "Console Xbox Series S" no carrinho
  
Quando clico no botao Adicionar ao carrinho 
     Clicar no botão Adicionar ao carrinho 
Então o produto vai para o carrinho de compras
     Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Dado que quero remover o produto do carrinho de compras
    Clicar no botão ir para o carrinho
Quando clico no botao Excluir 
    Remover o produto "Console Xbox Series S" do carrinho

Entao o carrinho de compras fica vazio 
    Verificar se o carrinho fica vazio    

    






