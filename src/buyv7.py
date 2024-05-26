import pymysql.cursors
import configparser
import re
import subprocess
import os
import sys

def conectar_bd(config_path):
    try:
        config = configparser.ConfigParser()
        config.read(config_path)
        db_config = config['DATABASE']

        conexao = pymysql.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        return conexao
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        sys.exit(1)

def login(config_path):
    email = input("Insira o email: ")
    password = input("Insira a password: ")

    conexao = conectar_bd(config_path)
    try:
        with conexao.cursor() as cursor:
            sql = "SELECT * FROM Operator WHERE email=%s AND password=%s"
            cursor.execute(sql, (email, password))
            resultado = cursor.fetchone()
            if resultado:
                print("Login bem-sucedido!")
                return resultado
            else:
                print("Nome de usuário ou senha inválidos.")
                return None
    except Exception as e:
        print(f"Erro ao executar a consulta SQL: {e}")
    finally:
        conexao.close()

def pesquisar_usuario(config_path):
    idoremail = input("Digite o ID do usuário ou email do utilizador: ")
    conexao = conectar_bd(config_path)
    
    try:
        with conexao.cursor() as cursor:
            sql = "SELECT * FROM Client WHERE id=%s OR email=%s"
            cursor.execute(sql, (idoremail, idoremail))
            resultado = cursor.fetchall()

            if resultado:
                print("Usuários encontrados:")
                larguras = [max(len(str(field)) for field in col) for col in zip(*resultado)]
                nomes_colunas = [column[0] for column in cursor.description]
                
                print("+" + "+".join("-" * (largura + 2) for largura in larguras) + "+")
                print("|" + "|".join(f" {campo:{largura}} " for campo, largura in zip(nomes_colunas, larguras)) + "|")
                print("+" + "+".join("-" * (largura + 2) for largura in larguras) + "+")
                
                for row in resultado:
                    print("|" + "|".join(f" {str(valor):{largura}} " for valor, largura in zip(row, larguras)) + "|")
                    print("+" + "+".join("-" * (largura + 2) for largura in larguras) + "+")
                
                acao = input("Você deseja (b)loquear ou (d)esbloquear estes usuários? ")
                if acao.lower() == 'b':
                    # Implementar lógica de bloqueio aqui
                    print("Contas dos usuários bloqueadas com sucesso.")
                elif acao.lower() == 'd':
                    # Implementar lógica de desbloqueio aqui
                    print("Contas dos usuários desbloqueadas com sucesso.")
                else:
                    print("Opção inválida.")
            else:
                print("Nenhum usuário encontrado.")
    finally:
        conexao.close()

def listar_produtos(config_path):
    conexao = conectar_bd(config_path)
    try:
        with conexao.cursor() as cursor:
            tipo_produto = input("Digite o tipo de produto (Book ou Electronic) ou deixe em branco para todos: ")
            quantidade_min = input("Digite a quantidade mínima ou deixe em branco para todos: ")
            quantidade_max = input("Digite a quantidade máxima ou deixe em branco para todos: ")
            preco_min = input("Digite o preço mínimo ou deixe em branco para todos: ")
            preco_max = input("Digite o preço máximo ou deixe em branco para todos: ")

            sql = "SELECT * FROM Product WHERE 1=1"
            params = []

            if tipo_produto:
                sql += " AND product_type = %s"
                params.append(tipo_produto)
            if quantidade_min:
                sql += " AND quantity >= %s"
                params.append(quantidade_min)
            if quantidade_max:
                sql += " AND quantity <= %s"
                params.append(quantidade_max)
            if preco_min:
                sql += " AND price >= %s"
                params.append(preco_min)
            if preco_max:
                sql += " AND price <= %s"
                params.append(preco_max)

            cursor.execute(sql, tuple(params))
            resultado = cursor.fetchall()
            if resultado:
                print("Produtos encontrados:")
                larguras = [max(len(str(field)) for field in col) for col in zip(*resultado)]
                nomes_colunas = [column[0] for column in cursor.description]
                
                print("+" + "+".join("-" * (largura + 2) for largura in larguras) + "+")
                print("|" + "|".join(f" {campo:{largura}} " for campo, largura in zip(nomes_colunas, larguras)) + "|")
                print("+" + "+".join("-" * (largura + 2) for largura in larguras) + "+")
                
                for row in resultado:
                    print("|" + "|".join(f" {str(valor):{largura}} " for valor, largura in zip(row, larguras)) + "|")
                    print("+" + "+".join("-" * (largura + 2) for largura in larguras) + "+")
            else:
                print("Nenhum produto encontrado com os critérios fornecidos.")
    finally:
        conexao.close()

def executar_backup(config_path):
    config = configparser.ConfigParser()
    config.read(config_path)
    db_config = config['DATABASE']
    
    nome_arquivo = input("Digite o nome do arquivo de backup: ")

    comando = f"mysqldump -u {db_config['user']} -p{db_config['password']} {db_config['database']} > {nome_arquivo}.sql"

    try:
        subprocess.run(comando, shell=True, check=True)
        print("Backup concluído com sucesso!")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar o backup: {e}")

def registar_produto(config_path):
    conexao = conectar_bd(config_path)
    try:
        with conexao.cursor() as cursor:
            nome = input("Digite o nome do produto: ")
            descricao = input("Digite a descrição do produto: ")
            preco = input("Digite o preço do produto: ")
            quantidade = input("Digite a quantidade do produto: ")
            tipo_produto = input("Digite o tipo do produto (Book ou Electronic): ")

            sql = "INSERT INTO Product (name, description, price, quantity, product_type) VALUES (%s, %s, %s, %s, %s)"
            cursor.execute(sql, (nome, descricao, preco, quantidade, tipo_produto))
            conexao.commit()
            print("Produto registrado com sucesso!")
    except Exception as e:
        print(f"Erro ao registrar o produto: {e}")
    finally:
        conexao.close()

def menu_principal(utilizador, config_path):
    while True:
        print("\nMenu Principal:")
        print("1. Pesquisar Utilizador")
        print("2. Listar Produtos")
        print("3. Registar Produtos")
        print("4. Backup")
        print("5. Logout")

        escolha = input("Escolha uma opção (1, 2, 3, 4 ou 5): ")

        if re.match(r'1', escolha):
            pesquisar_usuario(config_path)
        elif re.match(r'2', escolha):
            listar_produtos(config_path)
        elif re.match(r'3', escolha):
            registar_produto(config_path)
        elif re.match(r'4', escolha):
            executar_backup(config_path)
        elif re.match(r'5', escolha):
            print("Logout...")
            return
        else:
            print("Escolha inválida. Por favor, tente novamente.")

if __name__ == "__main__":
    config_path = input("Digite o caminho para o arquivo config.ini (pressione Enter para usar o diretório atual): ").strip()
    
    # If the input is empty, set the config file path to the current directory
    if not config_path:
        config_path = "config.ini"
    
    abs_config_path = os.path.abspath(config_path)

    if not os.path.isfile(abs_config_path):
        print(f"O arquivo de configuração {abs_config_path} não foi encontrado.")
        sys.exit(1)

    while True:
        utilizador = login(abs_config_path)
        if utilizador:
            print(f"Bem-vindo, {utilizador[1]}")  # Adjusted to print the name or appropriate field from the user record
            menu_principal(utilizador, abs_config_path)
        else:
            print("Falha no login. Tente novamente.")
