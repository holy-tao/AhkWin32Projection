#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_NegotiatedTlsExtensions structure contains information about the (D)TLS extensions negotiated for the current (D)TLS connection.
 * @remarks
 * 
  * The list of (D)TLS extensions returned via this structure is not exhaustive. Depending on the type of the (D)TLS extension, it is not always possible to determine whether it has been negotiated with the peer. This structure generally reports negotiable (D)TLS extensions of interest to SSPI callers, such as: Certificate Status Request, Application Layer Protocol Negotiation, Secure Real-time Transport Protocol, Token Binding, Extended Master Secret, Renegotiation Info.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_negotiatedtlsextensions
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_NegotiatedTlsExtensions extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of negotiated (D)TLS extensions.
     * @type {Integer}
     */
    ExtensionsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the array of 2-byte TLS extension IDs as defined in the [IANA (D)TLS extensions registry](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml).
     * @type {Pointer<UInt16>}
     */
    Extensions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
