#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_MSG_STATUS enumerated type defines the type of message being handled.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_msg_status
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_MSG_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
