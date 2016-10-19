CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_material` AS
    select 
        `produto`.`idProduto` AS `idProduto`,
        `produto`.`nome_produto` AS `nome_produto`,
        `produto`.`descricao` AS `descricao`,
        `material`.`nome_material` AS `nome_material`,
        `produto`.`preco` AS `preco`,
        `material`.`Produto_id` AS `Produto_id`
    from
        (`produto`
        join `material`)
    where
        (`material`.`Produto_id` = `produto`.`idProduto`)