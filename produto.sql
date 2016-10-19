CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_produto` AS
    select 
        `produto`.`idProduto` AS `idProduto`,
        `produto`.`nome_produto` AS `nome_produto`,
        `produto`.`descricao` AS `descricao`,
        `produto`.`preco` AS `preco`,
        `img`.`Produto_id` AS `Produto_id`,
        `img`.`img_local` AS `img_local`
    from
        (`produto`
        join `img`)
    where
        (`img`.`Produto_id` = `produto`.`idProduto`)