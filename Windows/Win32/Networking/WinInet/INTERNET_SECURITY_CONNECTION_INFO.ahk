#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Authentication\Identity\SecPkgContext_CipherInfo.ahk" { SecPkgContext_CipherInfo }
#Import "..\..\Security\Authentication\Identity\SecPkgContext_ConnectionInfo.ahk" { SecPkgContext_ConnectionInfo }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Security\Cryptography\ALG_ID.ahk" { ALG_ID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_SECURITY_CONNECTION_INFO {
    #StructPack 4

    dwSize : UInt32

    fSecure : BOOL

    connectionInfo : SecPkgContext_ConnectionInfo

    cipherInfo : SecPkgContext_CipherInfo

}
