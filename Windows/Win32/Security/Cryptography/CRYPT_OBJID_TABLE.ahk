#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_OBJID_TABLE {
    #StructPack 8

    dwAlgId : UInt32

    pszObjId : PSTR

}
