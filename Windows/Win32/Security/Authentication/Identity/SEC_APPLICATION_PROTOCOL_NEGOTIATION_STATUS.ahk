#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the status of the SEC application protocol negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS extends Win32Enum {

    /**
     * No application protocol was negotiated.
     * Native name: SecApplicationProtocolNegotiationStatus_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The application protocol was negotiated successfully.
     * Native name: SecApplicationProtocolNegotiationStatus_Success
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * The application protocol was negotiated successfully, but for selected clients only.
     * Native name: SecApplicationProtocolNegotiationStatus_SelectedClientOnly
     * @type {Integer (Int32)}
     */
    static SelectedClientOnly => 2
}
