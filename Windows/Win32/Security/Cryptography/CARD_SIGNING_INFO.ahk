#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALG_ID.ahk" { ALG_ID }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_SIGNING_INFO {
    #StructPack 8

    dwVersion : UInt32

    bContainerIndex : Int8

    dwKeySpec : UInt32

    dwSigningFlags : UInt32

    aiHashAlg : ALG_ID

    pbData : IntPtr

    cbData : UInt32

    pbSignedData : IntPtr

    cbSignedData : UInt32

    pPaddingInfo : IntPtr

    dwPaddingType : UInt32

}
