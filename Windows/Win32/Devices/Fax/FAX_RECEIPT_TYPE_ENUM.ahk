#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_RECEIPT_TYPE_ENUM enumeration defines the types of delivery reports (delivery receipt formats) for outbound faxes. The members of this enumeration are bit values and can be used in combination.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_receipt_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_RECEIPT_TYPE_ENUM extends Win32Enum{

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
