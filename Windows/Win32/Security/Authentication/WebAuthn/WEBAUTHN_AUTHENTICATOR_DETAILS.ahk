#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_AUTHENTICATOR_DETAILS {
    #StructPack 8

    dwVersion : UInt32

    cbAuthenticatorId : UInt32

    pbAuthenticatorId : IntPtr

    pwszAuthenticatorName : PWSTR

    cbAuthenticatorLogo : UInt32

    pbAuthenticatorLogo : IntPtr

    bLocked : BOOL

}
