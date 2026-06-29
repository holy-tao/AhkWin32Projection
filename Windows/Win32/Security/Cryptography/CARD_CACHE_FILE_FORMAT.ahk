#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_CACHE_FILE_FORMAT {
    #StructPack 2

    bVersion : Int8

    bPinsFreshness : Int8

    wContainersFreshness : UInt16

    wFilesFreshness : UInt16

}
