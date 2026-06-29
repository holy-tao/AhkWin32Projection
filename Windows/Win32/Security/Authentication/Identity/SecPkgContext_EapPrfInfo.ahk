#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the pseudorandom function (PRF) and extracts key data used by the Extensible Authentication Protocol (EAP) Transport Layer Security protocol (TLS) Authentication Protocol.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_eapprfinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_EapPrfInfo {
    #StructPack 8

    /**
     * Reserved. Must be set to zero.
     */
    dwVersion : UInt32

    /**
     * The size, in bytes, of the <i>pbPrfData</i> array.
     */
    cbPrfData : UInt32

    pbPrfData : IntPtr

}
