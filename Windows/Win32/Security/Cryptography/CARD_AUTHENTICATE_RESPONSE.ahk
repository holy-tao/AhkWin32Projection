#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_AUTHENTICATE_RESPONSE {
    #StructPack 4

    dwVersion : UInt32

    cbSessionPin : UInt32

    cAttemptsRemaining : UInt32

    pbSessionPin : Int8[1]

}
