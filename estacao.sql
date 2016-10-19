CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_estacao` AS
    select 
        `produto`.`idProduto` AS `idProduto`,
        `produto`.`nome_produto` AS `nome_produto`,
        `produto`.`descricao` AS `descricao`,
        `estacao`.`nome_estacao` AS `nome_estacao`,
        `produto`.`preco` AS `preco`,
        `estacao`.`Produto_id` AS `Produto_id`
    from
        (`produto`
        join `estacao`)
    where
        (`estacao`.`Produto_id` = `produto`.`idProduto`)