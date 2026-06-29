#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_PLUGIN_USER_VERIFICATION_REQUEST {
    #StructPack 8

    hwnd : HWND

    rguidTransactionId : Guid.Ptr

    pwszUsername : PWSTR

    pwszDisplayHint : PWSTR

}
