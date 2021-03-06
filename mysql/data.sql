create database if not exists pfa;
use pfa;

create table if not exists modules (
    id int(11) auto_increment,
    title VARCHAR(255),
    PRIMARY KEY (id)
);

insert into modules(title) value('Docker');
insert into modules(title) value('Fundamentos de Arquitetura de Software');
insert into modules(title) value('Comunicacao');
insert into modules(title) value('RabbitMQ');
insert into modules(title) value('Autenticacao com Keycloak');
insert into modules(title) value('DDD e Arquitteura Hexagonal');
insert into modules(title) value('Arquitetura do Projeto - CodeFlix');
insert into modules(title) value('Microserviço: Cataçogo de Vídeos com Laravel (Backend)');
insert into modules(title) value('Microserviço: Cataçogo de Vídeos com React (Front-End)');
insert into modules(title) value('Microserviço API do Catalogo com Node.JS (Backend)');
insert into modules(title) value('Microserviço - Aplicacao do Assinante com React.JS (Front-end) (Em Breve)');
insert into modules(title) value('Autenticacao entre Microserviços');
insert into modules(title) value('Microserviço - Assinatura com Django (Backend) - (em breve)');
insert into modules(title) value('Apache Kafka (Em Breve)');
insert into modules(title) value('Service Discovery (em breve)');
insert into modules(title) value('Padroes e tecnicas avançadas com Git e Github');
insert into modules(title) value('Integracao Continua');
insert into modules(title) value('Integracao Continua');
insert into modules(title) value('Kubernetes');
insert into modules(title) value('Service Mesh com Istio (em breve)');
insert into modules(title) value('Observabilidade (em breve)');
insert into modules(title) value('Deploy nos cloud providers (em breve)');
