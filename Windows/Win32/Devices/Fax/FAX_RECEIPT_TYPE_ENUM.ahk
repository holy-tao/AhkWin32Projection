#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_RECEIPT_TYPE_ENUM enumeration defines the types of delivery reports (delivery receipt formats) for outbound faxes. The members of this enumeration are bit values and can be used in combination.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_receipt_type_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_RECEIPT_TYPE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not send a delivery report.
     * @type {Integer (Int32)}
     */
    static frtNONE => 0

    /**
     * Send a delivery report through SMTP mail.
     * @type {Integer (Int32)}
     */
    static frtMAIL => 1

    /**
     * Display a delivery report in a message box on the display of a specific computer. This is not supported in Windows Vista.
     * @type {Integer (Int32)}
     */
    static frtMSGBOX => 4
}
