#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the application protocol extension that is negotiated.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_ext
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT extends Win32Enum {

    /**
     * No application protocol extension is used.
     * Native name: SecApplicationProtocolNegotiationExt_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Next Protocol Negotiation (NPN) type.
     * Native name: SecApplicationProtocolNegotiationExt_NPN
     * @type {Integer (Int32)}
     */
    static NPN => 1

    /**
     * Application-Layer Protocol Negotiation (ALPN) type.
     * Native name: SecApplicationProtocolNegotiationExt_ALPN
     * @type {Integer (Int32)}
     */
    static ALPN => 2
}
