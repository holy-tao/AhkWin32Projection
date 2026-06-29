#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPC_LINK.ahk" { SPC_LINK }
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_IMAGE {
    #StructPack 8

    pImageLink : SPC_LINK.Ptr

    Bitmap : CRYPT_INTEGER_BLOB

    Metafile : CRYPT_INTEGER_BLOB

    EnhancedMetafile : CRYPT_INTEGER_BLOB

    GifFile : CRYPT_INTEGER_BLOB

}
