#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_ConnectionInfoEx {
    #StructPack 4

    dwVersion : UInt32

    dwProtocol : UInt32

    szCipher : WCHAR[64]

    dwCipherStrength : UInt32

    szHash : WCHAR[64]

    dwHashStrength : UInt32

    szExchange : WCHAR[64]

    dwExchStrength : UInt32

}
