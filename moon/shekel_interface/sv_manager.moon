-- Sends a JSON struct of one or many players' purchased products
statusMessage = "CFC_ShekelInterface_PlayersProductStatus"
util.AddNetworkString statusMessage

hook.Add "PlayerInitialSpawn", "CFC_ShekelInterface_SyncProductStatus", (ply) ->
    cb = (products, raw) ->
        rf = RecipientFilter!
        rf\AddAllPlayers!
        rf\RemovePlayer ply

        net.Start statusMessage
        net.WriteTable {
            [ply] = raw
        }
        net.Send rf

        ply\SetProductData products, raw
        productData = ply, ply\GetProductData!.raw for ply in player.GetAll!

        timer.Simple 25, ->
            net.Start statusMessage
            net.WriteTable productData
            net.Send ply

    ShekelInterface\GetPlayerProducts ply, cb
