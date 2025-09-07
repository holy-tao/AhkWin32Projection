#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NET_IF_ACCESS_TYPE enumeration type specifies the NDIS network interface direction type.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ne-ifdef-net_if_direction_type
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_IF_DIRECTION_TYPE{

    /**
     * Indicates the send and receive direction type. This direction type indicates that the NDIS network
 *      interface can send and receive data.
     * @type {Integer (Int32)}
     */
    static NET_IF_DIRECTION_SENDRECEIVE => 0

    /**
     * Indicates the send only direction type. This direction type indicates that the NDIS network
 *      interface can only send data.
     * @type {Integer (Int32)}
     */
    static NET_IF_DIRECTION_SENDONLY => 1

    /**
     * Indicates the receive only direction type. This direction type indicates that the NDIS network
 *      interface can only receive data.
     * @type {Integer (Int32)}
     */
    static NET_IF_DIRECTION_RECEIVEONLY => 2

    /**
     * A maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NET_IF_DIRECTION_MAXIMUM => 3
}
