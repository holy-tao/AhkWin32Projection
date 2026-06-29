#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the SALT values for the Hmac-Secret.
 * @remarks
 * SALT values, by default, are converted into RAW Hmac-Secret values as per PRF extension.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_hmac_secret_salt
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_HMAC_SECRET_SALT {
    #StructPack 8

    /**
     * The size of pbFirst.
     */
    cbFirst : UInt32

    /**
     * The first SALT value.
     */
    pbFirst : IntPtr

    /**
     * THe size of pbSecond.
     */
    cbSecond : UInt32

    /**
     * The second SALT value.
     */
    pbSecond : IntPtr

}
