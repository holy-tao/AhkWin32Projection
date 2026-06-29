#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the options for the WebAuthNGetPlatformCredentialsList function.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_get_credentials_options
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_GET_CREDENTIALS_OPTIONS {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The Id of the relying party that is making the request. This field is _optional_.
     */
    pwszRpId : PWSTR

    /**
     * Is browser in-private mode. This field is _optional_ and defaults to **FALSE**.
     */
    bBrowserInPrivateMode : BOOL

}
