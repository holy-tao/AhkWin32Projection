#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_RSA_DECRYPT_INFO {
    #StructPack 8

    dwVersion : UInt32

    bContainerIndex : Int8

    dwKeySpec : UInt32

    pbData : IntPtr

    cbData : UInt32

    pPaddingInfo : IntPtr

    dwPaddingType : UInt32

}
