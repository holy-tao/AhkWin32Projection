#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_SMS_FLAG enumerated type specifies the SMS message class.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_flag
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_SMS_FLAG extends Win32Enum {

    /**
     * Refers to all the messages in the device message store.
     * Native name: MBN_SMS_FLAG_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 0

    /**
     * Refers to a single message in the device message store.
     * Native name: MBN_SMS_FLAG_INDEX
     * @type {Integer (Int32)}
     */
    static INDEX => 1

    /**
     * Refers to all new received and unread messages.
     * Native name: MBN_SMS_FLAG_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 2

    /**
     * Refers to all old and read messages.
     * Native name: MBN_SMS_FLAG_OLD
     * @type {Integer (Int32)}
     */
    static OLD => 3

    /**
     * Refers to all sent and saved messages.
     * Native name: MBN_SMS_FLAG_SENT
     * @type {Integer (Int32)}
     */
    static SENT => 4

    /**
     * Refers to all unsent and saved messages.
     * Native name: MBN_SMS_FLAG_DRAFT
     * @type {Integer (Int32)}
     */
    static DRAFT => 5
}
