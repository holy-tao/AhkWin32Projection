#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the status of the SEC application protocol negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_application_protocol_negotiation_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
