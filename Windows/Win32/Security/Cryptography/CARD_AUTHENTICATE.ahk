#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_AUTHENTICATE {
    #StructPack 4

    dwVersion : UInt32

    dwFlags : UInt32

    PinId : UInt32

    cbPinData : UInt32

    pbPinData : Int8[1]

}
