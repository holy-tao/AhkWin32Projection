#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Format of SMS messages.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_format
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_SMS_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No SMS format.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FORMAT_NONE => 0

    /**
     * For GSM devices, SMS, messages will be read in PDU format. 
     * 
     * For CDMA devices, SMS messages will be read in binary CDMA format.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FORMAT_PDU => 1

    /**
     * For CDMA devices, SMS messages will be read in text format.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FORMAT_TEXT => 2
}
