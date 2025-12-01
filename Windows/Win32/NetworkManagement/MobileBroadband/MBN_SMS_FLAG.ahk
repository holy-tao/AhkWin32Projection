#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_SMS_FLAG enumerated type specifies the SMS message class.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_flag
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SMS_FLAG extends Win32Enum{

    /**
     * Refers to all the messages in the device message store.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_ALL => 0

    /**
     * Refers to a single message in the device message store.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_INDEX => 1

    /**
     * Refers to all new received and unread messages.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_NEW => 2

    /**
     * Refers to all old and read messages.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_OLD => 3

    /**
     * Refers to all sent and saved messages.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_SENT => 4

    /**
     * Refers to all unsent and saved messages.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_FLAG_DRAFT => 5
}
