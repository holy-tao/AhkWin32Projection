#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_MSG_STATUS enumerated type defines the type of message being handled.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_msg_status
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_MSG_STATUS extends Win32Enum {

    /**
     * The received message is newly arrived or unread.
     * Native name: MBN_MSG_STATUS_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 0

    /**
     * The received message is old and read.
     * Native name: MBN_MSG_STATUS_OLD
     * @type {Integer (Int32)}
     */
    static OLD => 1

    /**
     * The outgoing message is unsent and stored in the device.
     * Native name: MBN_MSG_STATUS_DRAFT
     * @type {Integer (Int32)}
     */
    static DRAFT => 2

    /**
     * The outgoing message is already sent.
     * Native name: MBN_MSG_STATUS_SENT
     * @type {Integer (Int32)}
     */
    static SENT => 3
}
