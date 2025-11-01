#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_ext
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT{

    /**
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationExt_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationExt_NPN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationExt_ALPN => 2
}
