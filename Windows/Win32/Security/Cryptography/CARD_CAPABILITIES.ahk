#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_CAPABILITIES {
    #StructPack 4

    dwVersion : UInt32

    fCertificateCompression : BOOL

    fKeyGen : BOOL

}
