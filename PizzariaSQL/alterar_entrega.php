<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se o ID do contato existe, por exemplo, update.php?id=1 irá obter o contato com o id 1
if (isset($_GET['id'])) {
    if (!empty($_POST)) {
        // Esta parte é semelhante ao create.php, mas aqui estamos atualizando um registro e não inserindo
        $id_entregas = isset($_POST['id']) ? $_POST['id'] : NULL;
        $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
        $email = isset($_POST['email']) ? $_POST['email'] : '';
        $cel = isset($_POST['cel']) ? $_POST['cel'] : '';
        $pizza = isset($_POST['pizza']) ? $_POST['pizza'] : '';
        $cadastro = isset($_POST['cadastro']) ? $_POST['cadastro'] : date('Y-m-d H:i:s');
        $situacao = isset($_POST['situacao']) ? $_POST['situacao'] : '';
        // Atualiza o registro
        $stmt = $pdo->prepare('UPDATE entregas SET id_entregas = ?, nome = ?, email = ?, cel = ?, pizza = ?, cadastro = ?, situacao = ? WHERE id_entregas = ?');
        $stmt->execute([$id_entregas, $nome, $email, $cel, $pizza, $cadastro, $situacao, $_GET['id']]);
        $msg = 'Atualização Realizada com Sucesso!';
    }
    // Obter o contato da tabela entregas
    $stmt = $pdo->prepare('SELECT * FROM entregas WHERE id_entregas = ?');
    $stmt->execute([$_GET['id']]);
    $contatos = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$contatos) {
        exit('Entrega Não Localizado!');
    }
} else {
    exit('Nenhuma Entrega Especificada!');
}
?>


<?=template_header('Atualizar/Alterar Entregas')?>

<div class="content update">
	<h2>Atualizar Pedido ---- <?=$contatos['nome']?></h2>
    <form action="alterar_entrega.php?id=<?=$contatos['id_entregas']?>" method="post">
        <label for="id_entregas">ID</label>
        <label for="nome">Nome</label>
        <input type="text" name="id" placeholder="" value="<?=$contatos['id_entregas']?>" id="id_entregas">
        <input type="text" name="nome" placeholder="Seu Nome" value="<?=$contatos['nome']?>" id="nome">
        <label for="email">Email</label>
        <label for="cel">Celular</label>
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" value="<?=$contatos['email']?>" id="email">
        <input type="text" name="cel" placeholder="(XX) X.XXXX-XXXX" value="<?=$contatos['cel']?>" id="cel">
        <label for="pizza">Pizza</label>
        <label for="created">Criação</label>
        <input type="text" name="pizza" placeholder="Pizza" value="<?=$contatos['pizza']?>" id="pizza">
        <input type="datetime-local" name="cadastro" value="<?=date('Y-m-d\TH:i', strtotime($contatos['cadastro']))?>" id="cadastro">
        <select name="situacao" id="situacao" class="custom-select">
    <option value="andamento">Andamento</option>
    <option value="entregue">Entregue</option>
    <option value="cancelada">Cancelada</option>
    </select>
        <input type="submit" value="Atualizar">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>