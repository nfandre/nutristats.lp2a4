<%@page import="PersistJPA.UsuarioPersist"%>
<%@page import="Model.Dieta"%>
<%@page import="PersistJPA.DietaPersist"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.5.3/css/foundation.css">
    <link href="lib/css/style.css" rel="stylesheet" type="text/css">
    <link href="lib/css/login.css" rel="stylesheet" type="text/css">
	<link href="lib/css/dieta.css" rel="stylesheet" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.5.3/js/foundation.js"></script>
    <script src="lib/js/script.js" defer></script>

    <title>NutriStats</title>
</head>
<body>
		<% if(request.getAttribute("userLogado") != null) { %>
    <header>
        <ul class="menu align-center">
            
            <li><a href="./UsuarioControlador?rota=telaInicial">Home</a></li>
            <% Usuario u = (Usuario) request.getAttribute("userLogado");
            String nome = u.getNome().split(" ")[0];
            %>
            <li><a>Bem Vindo, <%=nome %></a></li>
            
        </ul>
        
    </header>
    <main>
     <footer>
        <div class="row">
            <div class="columns">
</div>
</div>

                <a data-open="logout">Logout</a>
                <a data-open="perfil">Perfil</a>
                 

                <div class="reveal" id="logout" data-reveal>
                    <h4><strong>Deseja sair?</strong></h4>
                        <div class="btn">
                            <a href="./UsuarioControlador?rota=deslogar" type="submit" class="secondary button" "> Sair</a> <br>
                            <small>Voc� ser� direcionado para a tela inicial</small> <br>
                            <%-- <a data-open="cadastro" class="secondary button">Cadastrar</a> --%>
                        </div>
                    <button class="close-button" data-close aria-label="Close reveal" type="button">
                    <span aria-hidden="true">&times;</span>
                </div>
                   <div class="reveal" id="perfil" data-reveal>
                   <div class="card-profile-stats">
  <div class="card-profile-stats-intro">

    <img class="card-profile-stats-intro-pic" src="lib/imagens/semFoto.png" alt="profile-image" />
    <div class="card-profile-stats-intro-content">
      <h3><%=u.getNome() %></h3>
      <p>@<%=u.getNomeUsuario() %></small></p>
    </div> <!-- /.card-profile-stats-intro-content -->
  </div> <!-- /.card-profile-stats-intro -->

  <hr />

  <div class="card-profile-stats-container">
    <div class="card-profile-stats-statistic">
      <span class="stat">25</span>
      <p>IMC</p>
    </div> <!-- /.card-profile-stats-statistic -->
    <div class="card-profile-stats-statistic">
      <span class="stat">125</span>
      <p>TMB</p>
    </div> <!-- /.card-profile-stats-statistic -->
    <div class="card-profile-stats-statistic">
      <span class="stat">10</span>
      <p>Dietas</p>
    </div> <!-- /.card-profile-stats-statistic -->
  </div> <!-- /.card-profile-stats-container -->
   <a data-open="editar">Editar</a>
   
      <div class="reveal" id="editar" data-reveal>
  <form action="./UsuarioControlador?rota=editar" method="post">
                                <h1><strong>Cadastro do Site</strong></h1>
                                <h4><strong>Dados Principais</strong></h4>
                                <label for="nome">Nome Completo
                                    <input type="text" name="nomeUser" id="nomeUser" value ="<%=u.getNome()%>">
                                </label>
                                <label for="email">Endere�o de E-mail
                                    <input type="email" name="email" id="email" value="<%=u.getEmail()%>">
                                </label>
                                <label for="dataNasc">Data de Nascimento
                                    <input type="date" name="dataNasc" id="dataNasc" value="<%=u.getDtaNascimento()%>">
                                </label>
                                <label for="sexo">Sexo
                                    <select name="sexo" id="sexo" value="">
                                        <option value="m">Masculino</option>
                                        <option value="f">Feminino</option>
                                        <option value="o">Outro</option>
                                    </select>
                                </label>
                                <hr>
                                <h4><strong>Dados de Login</strong></h4>
                                <label for="username">Nome de Usu�rio
                                    <input type="text" name="username" id="username" required value="<%=u.getNomeUsuario()%>">
                                </label>
                                <label for="senha">Senha
                                    <input type="password" name="senha" id="senha" required >
                                </label>
                                <label for="confirmSenha">Confirme a Senha
                                    <input type="password" name="confirmSenhaUser" id="confirmSenhaUser" required>
                                </label>
                                <div class="btn">
                                    <input type="submit" class="secondary button large" value="Editar">
                                </div>
                                <button class="close-button" data-close aria-label="Close reveal" type="button">
                                <span aria-hidden="true">&times;</span>
                            </form>
                </div>
   
   
   
  <div class="card-profile-stats-more">
    <p class="card-profile-stats-more-link"><a href="#"><i class="fa fa-angle-down" aria-hidden="true"></i></a></p>
    <div class="card-profile-stats-more-content">
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem libero fugit, pariatur maxime! Optio enim, deserunt quia molestiae fugiat delectus, dolore et esse nostrum, quod autem necessitatibus fugit soluta repellendus.
      </p>
    </div> <!-- /.card-profile-stats-more-content -->
  </div> <!-- /.card-profile-stats-more -->
</div> <!-- /.card-profile-stats -->
                    <button class="close-button" data-close aria-label="Close reveal" type="button">
                    <span aria-hidden="true">&times;</span>
                </div>

              
    </footer>
  
    	 
     <%
     	Dieta de = new Dieta();
     	de.setDescricao("Para ferias");
     	de.setCafeManha("Frutas");
     	de.setCafeTarde("P�aao");
     	de.setAlmoco("arraz");
     	de.setJanta("feij�o");
     	UsuarioPersist up = new UsuarioPersist();
     	Usuario upt = up.verificarNomeUsuarioExiste("andre");
     	de.setUsuario(u);
	
     	
	    	DietaPersist dp = new DietaPersist();
 	     //	dp.save(de);
	    	List<Dieta> dietas = null;
	    	
	    		dietas =	dp.pesquisarDietaPorUsuario(u.getId());
	    		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+dietas.size());
	    	if(dietas!= null && dietas.size() !=0){
	    		%>
	    	   <div align="center">
  <a href="./UsuarioControlador?rota=CadastrarDieta" type="submit" class="button sucess">Cadastrar</a> <br>
  </div>
	    		<%
	    		
	    	for(Dieta d: dietas){
			
	    %>
		
          
    
    <div align="center">

    <div class="card" style="width: 500px;">
  <div class="card-divider">
  		<%=d.getDescricao()%>
  		
  </div>
  <div class="card-section">
    <p style="color: black">Caf� da manh�: <%=d.getCafeManha() %>   </p>
    
    
   <hr>
        <p style="color: black">Almo�o: <%=d.getAlmoco() %>   </p>
        <hr>
        <p style="color: black">Caf� da tarde:  <%=d.getCafeTarde() %>   </p>
        <hr>
        <p style="color: black">Jantar: <%=d.getJanta() %>   </p>
  </div>
  
</div>
 <%
 
 request.setAttribute("dieta", d);
 
	
 %>
 <a href="./UsuarioControlador?rota=excluirDieta&i=<%=d.getId()%>" type="submit" class="secondary button" ">Excluir</a>
 <a href="./UsuarioControlador?rota=editarDieta&i=<%=d.getId()%>" type="submit" class="button sucess  ">Editar</a> <br>
 
 </div>  <hr>

	 <%
	    	}
	    	
		  }else{
			  %>
	<div align="center">		 
  <div class="card" style="width: 500px;" align="center" >
  <div class="card-divider">
  		Nenhuma dieta Cadastrada. Deseja Cadastrar?
  		
  </div>
</div>
     <a href="./UsuarioControlador?rota=CadastrarDieta" type="submit" class="button sucess">Cadastrar</a> <br>
</div>			 
			  <%
		  }
	    
	    %>


  <% } else { %>
    
    <div class="fundo">
                <div class="caixa">
                        <div>


                                <form action="index.jsp" method="post">
                                    <br>
                                    <h3 style="color: white">Usu�rio An�nimo</h3>

                                    <br>
                                    <button type="submit">Voltar a Tela Inicial</button>
                                </form>
                            </div>        
                       
                     </div>
                </div>
                
       
    
    <% } %>
    
    </main>
</body>
</html>