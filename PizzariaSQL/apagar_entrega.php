<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se o ID do contato existe
if (isset($_GET['id'])) {
    // Seleciona o registro que será deletado
    $stmt = $pdo->prepare('SELECT * FROM entregas WHERE id_entregas = ?');
    $stmt->execute([$_GET['id']]);
    $contact = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$contact) {
        exit('Entrega Não Localizada!');
    }
    // Certifique-se de que o usuário confirma antes da exclusão
    if (isset($_GET['confirm'])) {
        if ($_GET['confirm'] == 'yes') {
            // O usuário clicou no botão "Sim", deleta o registro
            $stmt = $pdo->prepare('DELETE FROM entregas WHERE id_entregas = ?');
            $stmt->execute([$_GET['id']]);
            $msg = 'Entrega Cancelada com Sucesso!';
        } else {
            // O usuário clicou no botão "Não", redireciona de volta para a página de leitura
            header('Location: ler_entregas.php');
            exit;
        }
    }
} else {
    exit('Nenhum ID especificado!');
}
?>


<?=template_header('Apagar Entrega')?>

<div class="content delete">
	<h2>Apagar Pedido ----  <?=$contact['nome']?></h2>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php else: ?>
	<p>Você tem certeza que deseja apagar o contato ----<?=$contact['nome']?>?</p>
    <div class="yesno">
        <a href="apagar_entrega.php?id=<?=$contact['id_entregas']?>&confirm=yes">Sim</a>
        <a href="apagar_entrega.php?id=<?=$contact['id_entregas']?>&confirm=no">Não</a>
    </div>
    <?php endif; ?>
</div>

<?=template_footer()?>