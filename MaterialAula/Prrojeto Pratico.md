# Requisitos

- [ ] Criação de oportunidade de potencial cliente. Seja recorrente ou primeiro projeto.
- [ ] Para a oportunidade devem ser cadastrados:
	- [ ] Detalhamento do projeto
	- [ ] Tempo estimado do projeto
	- [ ] Data Inicio e Data Fim
	- [ ] Custo estimado do projeto
	- [ ] Valor da proposta
	- [ ] Anexo de documentos (NDA e proposta)
- [ ] Uma vez que todos os campos estejam preenchidos, a oportunidade segue para **negociação** onde devem ser atualizados os valores de *Tempo estimado do projeto*, *custo estimado do projeto* e *valor da proposta*.
- [ ] Para a negociação estar completa, deve ser anexado uma imagem ou documento que comprove o **"de acordo"** do cliente com a proposta apresentada e negociada.
- [ ] Após a negociação e o ok do cliente, a oportunidade vai para a fase de **formalização**, onde os envolvidos assinam o contrato via email.
- [ ] A proposta é finalizada com o upload do documento assinado.
- [ ] Em qualquer momento a oportunidade deve poder ser **negada**.
- [ ] Durante as etapas antes da aprovação, deve estar presente um componente LCW que indique graficamente em até 5 níveis, o nível de satisfação do cliente ou probabilidade de sucesso da oportunidade. O usuário deve indicar esse valor.

# Estágios da Oportunidade

| Número | Nome        | Descrição                                                     |
| ------ | ----------- | ------------------------------------------------------------- |
| 1      | Prospecting | Prospecção da oportunidade, avaliando viabilidade da proposta |
| 2      | Negotiating | Fase de negociação                                            |
| 3      | Formalizing | Envio e assinatura de contrato                                | 
| 4      | Won         | Proposta finalizada, assinada e aceita pelo cliente           |
| 5      | Cancelled   | Cancelada por alguma das partes                               |

# Passos 1 e 2

Utilizei o objeto padrão Opportunity para seguir a boa prática de não não criar uma solução customizada para algo que a plataforma já atende. 

Se fez necessário criar alguns campos, como documentado abaixo.

## Objeto: Opportunity

| Name        | API Name    |
| ----------- | ----------- |
| Opportunity | Opportunity | 

### Custom Fields

| Name             | API Name            | Description                        |
| ---------------- | ------------------- | ---------------------------------- |
| Project Duration | Project_Duration__c | Estimated project duration in days |
| Start Date       | Start_Date__c       | Project start date                 | 
| End Date         | End_Date__c         | Project end date                   |
| Project Cost     | Project_Cost__c     | Estimated project cost             |

## Etapas

### 1. Detalhamento do projeto 

Pode ser feito no campo padrão "description".

### 2. Tempo estimado do projeto

Criado um campo customizado chamado "Project Duration", que representa a duração do projeto em meses. Limite de 5 caracteres sem separador decimal. Decisão tomada pensando que dificilmente um projeto será negociado de uma vez com uma duração maior do que 120 meses (10 anos) porém, caso algo o faça ser realmente longo, temos 2 números a mais por segurança, podendo nos levar a maiores distancias do que seria razoável e crível.

### 3. Data de Inicio e Data de Fim 

Foram criados os campos do tipo date, "start date" e "end date" para representar as datas de inicio e fim do projeto.
O campo padrão "Close Date" será utilizado para marcar o dia de finalização do projeto, seja ele aprovado ou cancelado.

### 4. Custo estimado do projeto

Criado um campo do tipo currency "Project cost".

### 5. Valor da proposta

Utilizado o campo padrão "Amount".

### 6. Anexo de documentos

O objeto Opportunity permite o upload de arquivos e notas.

# Passo 5

## Coleta de Email

Para fazer a coleta de email obrigatória, a criação de um contato exige a inserção de um e-mail. (Regra de validação no campo contato)

É verificado por meio de uma trigger se a oportunidade tem uma conta com ao menos um contato no momento da mudança de estágio.