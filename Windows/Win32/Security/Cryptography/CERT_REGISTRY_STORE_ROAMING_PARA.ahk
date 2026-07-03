#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REGISTRY_STORE_ROAMING_PARA {
    #StructPack 8

    hKey : HKEY

    pwszStoreDirectory : PWSTR

}
