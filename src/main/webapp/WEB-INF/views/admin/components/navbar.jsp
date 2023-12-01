<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #449cd7;">
    <div class="container">
        <a class="navbar-brand" href="/java_contatosweb/admin/dashboard"><img src="../resources/images/will-contact-logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-2">
                    <a class="nav-link text-light" href="/java_contatosweb/admin/cadastrar-contato">Cadastrar Contato</a>
                </li>
                  <li class="nav-item dropdown text-end"> <!-- Adicionando a classe text-end aqui -->
                    <a class="nav-link dropdown-toggle text-light" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                       <img class="mx-1" src="../resources/images/icone-perfil.png" alt="Avatar"> <strong>${usuario_auth.nome}</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown"> <!-- Adicionando a classe dropdown-menu-end aqui -->
                        <li><a class="dropdown-item" href="#">Minha Conta</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                        	<a class="dropdown-item" href="/java_contatosweb/logout" 
                        		onclick="return confirm('Deseja realmente sair do sistema?');">
                        		Sair do Sistema
                        	</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
