#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The blob extension data for a credential.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cred_blob_extension
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CRED_BLOB_EXTENSION {
    #StructPack 8

    /**
     * Size of **pbCredBlob**.
     */
    cbCredBlob : UInt32

    /**
     * The credential blob.
     */
    pbCredBlob : IntPtr

}
