playerMeta = FindMetaTable "Player"

playerMeta.SetProductData = (products, raw) =>
    @ProductData = :products, :raw

playerMeta.GetProductData = => @ProductData

playerMeta.HasProduct = (identifier) =>
    @ProductData[identifier] == true
