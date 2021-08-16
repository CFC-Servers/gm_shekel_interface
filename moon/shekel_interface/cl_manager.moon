statusMessage = "CFC_ShekelInterface_PlayersProductStatus"

net.Receive statusMessage, ->
    productData = net.ReadTable!

    for ply in *player.GetAll!
        plyData = productData[ply]
        continue unless plyData

        products = Decompress JSONToTable plyData
        ply\SetProductData products, plyData
