#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_AUTHENTICATOR_DETAILS.ahk" { WEBAUTHN_AUTHENTICATOR_DETAILS }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_AUTHENTICATOR_DETAILS_LIST {
    #StructPack 8

    cAuthenticatorDetails : UInt32

    ppAuthenticatorDetails : IntPtr

}
