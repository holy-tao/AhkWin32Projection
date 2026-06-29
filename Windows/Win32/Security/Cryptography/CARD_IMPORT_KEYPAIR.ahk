#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_IMPORT_KEYPAIR {
    #StructPack 4

    dwVersion : UInt32

    bContainerIndex : Int8

    PinId : UInt32

    dwKeySpec : UInt32

    dwKeySize : UInt32

    cbInput : UInt32

    pbInput : Int8[1]

}
