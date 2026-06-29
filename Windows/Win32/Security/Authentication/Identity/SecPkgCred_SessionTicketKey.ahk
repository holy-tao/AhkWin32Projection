#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCred_SessionTicketKey {
    #StructPack 4

    TicketInfoVersion : UInt32

    KeyId : Int8[16]

    KeyingMaterial : Int8[64]

    KeyingMaterialSize : Int8

}
