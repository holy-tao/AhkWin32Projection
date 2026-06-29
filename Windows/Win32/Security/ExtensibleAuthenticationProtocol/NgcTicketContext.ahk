#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Cryptography\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct NgcTicketContext {
    #StructPack 8

    wszTicket : WCHAR[45]

    hKey : NCRYPT_KEY_HANDLE

    hImpersonateToken : HANDLE

}
