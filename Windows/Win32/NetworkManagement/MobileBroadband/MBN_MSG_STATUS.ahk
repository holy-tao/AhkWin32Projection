#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_MSG_STATUS enumerated type defines the type of message being handled.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_msg_status
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_MSG_STATUS{

    /**
     * The received message is newly arrived or unread.
     * @type {Integer (Int32)}
     */
    static MBN_MSG_STATUS_NEW => 0

    /**
     * The received message is old and read.
     * @type {Integer (Int32)}
     */
    static MBN_MSG_STATUS_OLD => 1

    /**
     * The outgoing message is unsent and stored in the device.
     * @type {Integer (Int32)}
     */
    static MBN_MSG_STATUS_DRAFT => 2

    /**
     * The outgoing message is already sent.
     * @type {Integer (Int32)}
     */
    static MBN_MSG_STATUS_SENT => 3
}
