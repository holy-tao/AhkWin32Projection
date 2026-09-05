#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Format of SMS messages.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_format
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_SMS_FORMAT extends Win32Enum {

    /**
     * No SMS format.
     * Native name: MBN_SMS_FORMAT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * For GSM devices, SMS, messages will be read in PDU format. 
     * 
     * For CDMA devices, SMS messages will be read in binary CDMA format.
     * Native name: MBN_SMS_FORMAT_PDU
     * @type {Integer (Int32)}
     */
    static PDU => 1

    /**
     * For CDMA devices, SMS messages will be read in text format.
     * Native name: MBN_SMS_FORMAT_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 2
}
