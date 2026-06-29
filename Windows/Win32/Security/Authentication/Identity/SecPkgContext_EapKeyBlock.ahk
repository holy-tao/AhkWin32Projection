#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains key data used by the EAP TLS Authentication Protocol.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_eapkeyblock
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_EapKeyBlock {
    #StructPack 1

    /**
     * An array of 128 bytes that contain key data used by the EAP TLS Authentication Protocol.
     */
    rgbKeys : Int8[128]

    /**
     * An array of 64 bytes that contain initialization vector data used by the EAP TLS Authentication Protocol.
     */
    rgbIVs : Int8[64]

}
