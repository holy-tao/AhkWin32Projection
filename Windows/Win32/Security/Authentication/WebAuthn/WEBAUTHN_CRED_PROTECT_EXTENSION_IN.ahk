#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the credential protect extension information.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cred_protect_extension_in
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CRED_PROTECT_EXTENSION_IN {
    #StructPack 4

    /**
     * One of the **WEBAUTHN_USER_VERIFICATION** values.
     */
    dwCredProtect : UInt32

    /**
     * Set the this to **TRUE** to require authenticator support for the **credProtect** extension.
     */
    bRequireCredProtect : BOOL

}
