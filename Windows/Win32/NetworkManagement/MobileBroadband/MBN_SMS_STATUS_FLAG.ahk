#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_SMS_STATUS_FLAG enumerated type indicates the status of a device's SMS message store.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_status_flag
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_SMS_STATUS_FLAG extends Win32Enum {

    /**
     * There is no SMS status information to report.
     * Native name: MBN_SMS_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The message store is full.
     * Native name: MBN_SMS_FLAG_MESSAGE_STORE_FULL
     * @type {Integer (Int32)}
     */
    static MESSAGE_STORE_FULL => 1

    /**
     * A new non-class 0 message has been received by the interface.
     * Native name: MBN_SMS_FLAG_NEW_MESSAGE
     * @type {Integer (Int32)}
     */
    static NEW_MESSAGE => 2
}
