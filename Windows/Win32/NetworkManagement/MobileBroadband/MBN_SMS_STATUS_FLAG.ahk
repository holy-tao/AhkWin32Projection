#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_SMS_STATUS_FLAG enumerated type indicates the status of a device's SMS message store.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_sms_status_flag
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SMS_STATUS_FLAG{

    /**
     * There is no SMS status information to report.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_NONE => 0

    /**
     * The message store is full.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_MESSAGE_STORE_FULL => 1

    /**
     * A new non-class 0 message has been received by the interface.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_NEW_MESSAGE => 2
}
