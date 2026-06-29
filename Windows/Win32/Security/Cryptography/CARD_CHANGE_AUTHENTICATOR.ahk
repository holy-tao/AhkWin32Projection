#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_CHANGE_AUTHENTICATOR {
    #StructPack 4

    dwVersion : UInt32

    dwFlags : UInt32

    dwAuthenticatingPinId : UInt32

    cbAuthenticatingPinData : UInt32

    dwTargetPinId : UInt32

    cbTargetData : UInt32

    cRetryCount : UInt32

    pbData : Int8[1]

}
