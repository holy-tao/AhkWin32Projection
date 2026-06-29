#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PctPublicKey {
    #StructPack 4

    Type : UInt32

    cbKey : UInt32

    pKey : Int8[1]

}
