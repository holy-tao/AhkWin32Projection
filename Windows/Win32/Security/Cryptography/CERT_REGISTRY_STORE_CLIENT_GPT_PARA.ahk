#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REGISTRY_STORE_CLIENT_GPT_PARA {
    #StructPack 8

    hKeyBase : HKEY

    pwszRegPath : PWSTR

}
