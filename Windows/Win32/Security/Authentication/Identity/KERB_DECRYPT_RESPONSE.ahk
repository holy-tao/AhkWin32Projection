#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_DECRYPT_RESPONSE {
    #StructPack 1

    DecryptedData : Int8[1]

}
