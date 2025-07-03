# **Proposta de Modelagem de Dados para Otimização de Respostas a Incidentes de Segurança Cibernética no Setor da Saúde**  

**Autor:** Arthur Pacheco de Menezes  
**Tutor externo:** Katyeudo Karlos de Sousa Oliveira  
**Repositório GitHub:** [github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados](https://github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados)  

---

## **📌 Descrição do Projeto**  
Este repositório contém os artefatos desenvolvidos para o trabalho acadêmico **"Proposta de Modelagem de Dados para Otimização de Respostas a Incidentes de Segurança Cibernética no Setor da Saúde"**, realizado no curso de Engenharia de Software (UNIASSELVI).  

O projeto propõe um **modelo de banco de dados relacional** (MySQL) para integrar sistemas de gestão de incidentes de cibersegurança em ambientes de saúde, alinhado a normativas como **ISO/IEC 27035**, **LGPD** e **DORA**. O foco é reduzir o tempo de detecção (MTTD) e resposta a ataques, especialmente em dispositivos médicos IoT.  

---

## **📂 Estrutura do Repositório**  
| Arquivo | Descrição |  
|---------|-----------|  
| [`banco_dados.sql`](https://github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados/blob/main/banco_dados.sql) | Script SQL com a criação do banco de dados e tabelas. |  
| [`Diagrama_ER.png`](https://github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados/blob/main/Diagrama_ER.png) | Diagrama Entidade-Relacionamento (ER) do modelo proposto. |  
| [`Captura de tela do banco`](https://github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados/blob/main/Captura%20de%20tela%20de%202025-07-03%2000-22-58.png) | Imagem ilustrativa da estrutura no SGBD. |  
| [`Resumo Expandido.pdf`](https://github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados/blob/main/Resumo%20Expandido.pdf) | Documento acadêmico com justificativas, requisitos e referências. |  

---

## **🔍 Principais Funcionalidades do Modelo**  
- **RF01:** Coleta e correlação de logs de dispositivos médicos em tempo real.  
- **RF02:** Classificação automática de incidentes por criticidade (ex: ransomware vs. acesso não autorizado).  
- **RF03:** Geração de relatórios auditáveis para compliance com LGPD/DORA.  
- **RF04:** Isolamento de dispositivos comprometidos via integração com arquitetura Zero Trust.  

**Requisitos Não-Funcionais:**  
- Disponibilidade de 99.99% (RNF01).  
- Criptografia AES-256 para dados sensíveis (RNF02).  
- Escalabilidade para processar 1TB/dia de logs (RNF03).  

---

## **🛠️ Como Executar o Banco de Dados**  
1. **Pré-requisitos:**  
   - MySQL instalado.  
   - Git (opcional, para clonar o repositório).  

2. **Importar o banco:**  
   ```bash
   git clone https://github.com/ArthurPMenezes/Proposta-de-Modelagem-de-Dados.git
   cd Proposta-de-Modelagem-de-Dados
   mysql -u [usuário] -p < banco_dados.sql
   ```

---

## **📚 Referências**  
- Normas: **ISO/IEC 27035**, **ISO 27799**, **LGPD**, **NIST SP 800-61r2**.  
- Relatórios: **SonicWall Cyber Threat Report (2025)**, **CERT.br**, **Health-ISAC**.  
- Casos reais: Ataques a hospitais (Prospect Medical Holdings, Brno).  

---

## **💡 Reflexões e Contribuições**  
O modelo aborda lacunas críticas como **fragmentação de dados** e **vulnerabilidades em IoT médica**, propondo soluções como:  
- Microsserviços para análise paralela de logs (inspirado no Deep Forgery Detector da NSF).  
- Filtros de machine learning para reduzir falsos positivos em SIEMs.  

**Desafios:** Dispositivos legados sem suporte a autenticação multifatorial (CISA, 2024).  

---

## **📬 Contato**  
✉ **Autor:** [7272073@aluno.uniasselvi.com.br](mailto:7272073@aluno.uniasselvi.com.br)  
✉ **Tutor:** [katyeudo.oliveira@regente.uniasselvi.com.br](mailto:katyeudo.oliveira@regente.uniasselvi.com.br)  

--- 

**🔗 Acesse o [Resumo Expandido](Resumo%20Expandido.pdf) para detalhes completos do projeto.**  

---  
*Licença: Creative Commons Attribution 4.0 (CC-BY-4.0).*  

--- 

### **🎯 Destaques do Projeto**  
✅ **Inovação:** Integração de SIEM + Zero Trust para saúde.  
✅ **Conformidade:** Alinhamento com LGPD e normas internacionais.  
✅ **Impacto:** Redução de 58% no MTTD (baseado em IBM Security, 2024).  

*(Atualizado em: Julho/2025)*
