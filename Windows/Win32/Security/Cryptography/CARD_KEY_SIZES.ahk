#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_KEY_SIZES {
    #StructPack 4

    dwVersion : UInt32

    dwMinimumBitlen : UInt32

    dwDefaultBitlen : UInt32

    dwMaximumBitlen : UInt32

    dwIncrementalBitlen : UInt32

}
