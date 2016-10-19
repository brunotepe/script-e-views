CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_cor` AS
    select 
        `produto`.`idProduto` AS `idProduto`,
        `produto`.`nome_produto` AS `nome_produto`,
        `produto`.`descricao` AS `descricao`,
        `cor`.`nome_cor` AS `nome_cor`,
        `produto`.`preco` AS `preco`,
        `cor`.`Produto_id` AS `Produto_id`
    from
        (`produto`
        join `cor`)
    where
        (`cor`.`Produto_id` = `produto`.`idProduto`)