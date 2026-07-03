#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT.ahk" { WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT }
#Import ".\WEBAUTHN_HMAC_SECRET_SALT.ahk" { WEBAUTHN_HMAC_SECRET_SALT }

/**
 * Contains the SALT values for the HMAC secret.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_hmac_secret_salt_values
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_HMAC_SECRET_SALT_VALUES {
    #StructPack 8

    /**
     * The global HMAC SALT.
     */
    pGlobalHmacSalt : WEBAUTHN_HMAC_SECRET_SALT.Ptr

    /**
     * The size of **pCredWithHmacSecretSaltList**.
     */
    cCredWithHmacSecretSaltList : UInt32

    /**
     * The list of credentials with HMAC secret SALT.
     */
    pCredWithHmacSecretSaltList : WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT.Ptr

}
