#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class WINUSB_PIPE_POLICY{

    /**
     * @type {Integer (UInt32)}
     */
    static SHORT_PACKET_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_CLEAR_STALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_TRANSFER_TIMEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IGNORE_SHORT_PACKETS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOW_PARTIAL_READS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_FLUSH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RAW_IO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_TRANSFER_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RESET_PIPE_ON_RESUME => 9
}
