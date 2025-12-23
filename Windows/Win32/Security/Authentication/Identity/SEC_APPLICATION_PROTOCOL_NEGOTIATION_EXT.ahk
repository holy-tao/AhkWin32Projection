#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the application protocol extension that is negotiated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_ext
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT extends Win32Enum{

    /**
     * No application protocol extension is used.
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationExt_None => 0

    /**
     * Next Protocol Negotiation (NPN) type.
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationExt_NPN => 1

    /**
     * Application-Layer Protocol Negotiation (ALPN) type.
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationExt_ALPN => 2
}
