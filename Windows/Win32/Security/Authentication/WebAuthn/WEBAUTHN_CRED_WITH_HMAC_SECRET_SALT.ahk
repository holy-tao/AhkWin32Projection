#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_HMAC_SECRET_SALT.ahk" { WEBAUTHN_HMAC_SECRET_SALT }

/**
 * The structure containing the credential with SALT values.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cred_with_hmac_secret_salt
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT {
    #StructPack 8

    /**
     * The size of **pbCredID**.
     */
    cbCredID : UInt32

    /**
     * The credential Id.
     */
    pbCredID : IntPtr

    /**
     * PRF Values for the credential.
     */
    pHmacSecretSalt : WEBAUTHN_HMAC_SECRET_SALT.Ptr

}
