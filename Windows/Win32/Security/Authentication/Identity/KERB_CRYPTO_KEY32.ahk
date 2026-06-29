#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CRYPTO_KEY32 {
    #StructPack 4

    KeyType : Int32

    Length : UInt32

    Offset : UInt32

}
