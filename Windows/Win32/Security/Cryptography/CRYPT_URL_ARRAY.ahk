#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_URL_ARRAY {
    #StructPack 8

    cUrl : UInt32

    rgwszUrl : PWSTR.Ptr

}
