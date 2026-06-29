#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPC_LINK.ahk" { SPC_LINK }
#Import "..\Cryptography\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_PE_IMAGE_DATA {
    #StructPack 8

    Flags : CRYPT_BIT_BLOB

    pFile : SPC_LINK.Ptr

}
