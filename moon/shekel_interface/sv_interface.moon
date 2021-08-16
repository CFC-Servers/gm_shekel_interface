import Decompress, JSONToTable from util

CreateConVar "CFC_ShekelInterface_ApiKey", "", FCVAR_PROTECTED
CreateConVar "CFC_ShekelInterface_BaseURL", "", FCVAR_PROTECTED

class ShekelInterface
    new: =>
        setupHookName = "CFC_ShekelInterface_Setup"
        hook.Add "Think", setupHookName, ->
            hook.Remove setupHookName

            @apiKey = GetConVar("CFC_ShekelInterface_ApiKey")\GetString!
            @baseURL = GetConVar("CFC_ShekelInterface_BaseURL")\GetString!

    GetPlayerProducts: (ply, cb) =>
        HTTP
            method: "GET"
            url: "#{@baseURL}/player/#{ply\SteamID64!}/products"
            headers:
                "Authorization": "Bearer #{@apiKey}"
                "Content-Type": "application/json"
                "Accept": "application/json"

            success: (code, body, headers) =>
                decomp = Decompress body
                products = JSONToTable decomp

                cb products, body

            failed: error

export ShekelInterface = ShekelInterface!
