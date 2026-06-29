#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_NegotiatedTlsExtensions structure contains information about the (D)TLS extensions negotiated for the current (D)TLS connection.
 * @remarks
 * The list of (D)TLS extensions returned via this structure is not exhaustive. Depending on the type of the (D)TLS extension, it is not always possible to determine whether it has been negotiated with the peer. This structure generally reports negotiable (D)TLS extensions of interest to SSPI callers, such as: Certificate Status Request, Application Layer Protocol Negotiation, Secure Real-time Transport Protocol, Token Binding, Extended Master Secret, Renegotiation Info.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_negotiatedtlsextensions
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_NegotiatedTlsExtensions {
    #StructPack 8

    /**
     * The number of negotiated (D)TLS extensions.
     */
    ExtensionsCount : UInt32

    /**
     * A pointer to the array of 2-byte TLS extension IDs as defined in the [IANA (D)TLS extensions registry](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml).
     */
    Extensions : IntPtr

}
