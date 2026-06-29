#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the application protocol extension that is negotiated.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_ext
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
