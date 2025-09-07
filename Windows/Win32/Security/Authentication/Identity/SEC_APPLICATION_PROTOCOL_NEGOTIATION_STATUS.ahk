#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the status of the SEC application protocol negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS{

    /**
     * No application protocol was negotiated.
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationStatus_None => 0

    /**
     * The application protocol was negotiated successfully.
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationStatus_Success => 1

    /**
     * The application protocol was negotiated successfully, but for selected clients only.
     * @type {Integer (Int32)}
     */
    static SecApplicationProtocolNegotiationStatus_SelectedClientOnly => 2
}
