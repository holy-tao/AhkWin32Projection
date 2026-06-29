#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The X.509 certificate chain.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_x5c
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_X5C {
    #StructPack 8

    /**
     * The length of X.509 encoded certificate.
     */
    cbData : UInt32

    /**
     * The X.509 encoded certificate bytes.
     */
    pbData : IntPtr

}
