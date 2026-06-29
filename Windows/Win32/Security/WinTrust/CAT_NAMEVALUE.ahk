#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CAT_NAMEVALUE {
    #StructPack 8

    pwszTag : PWSTR

    fdwFlags : UInt32

    Value : CRYPT_INTEGER_BLOB

}
