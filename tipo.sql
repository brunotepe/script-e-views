CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_tipo` AS
    select 
        `produto`.`idProduto` AS `idProduto`,
        `produto`.`nome_produto` AS `nome_produto`,
        `produto`.`descricao` AS `descricao`,
        `tipo`.`tipo_roupa` AS `tipo_roupa`,
        `produto`.`preco` AS `preco`,
        `tipo`.`Produto_id` AS `Produto_id`
    from
        (`produto`
        join `tipo`)
    where
        (`tipo`.`Produto_id` = `produto`.`idProduto`)