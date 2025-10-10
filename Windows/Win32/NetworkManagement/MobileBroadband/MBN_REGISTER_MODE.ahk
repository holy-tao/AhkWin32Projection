#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_REGISTER_MODE enumerated type indicates the network selection mode of a device.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_register_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_REGISTER_MODE{

    /**
     * No network selection mode is defined.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_MODE_NONE => 0

    /**
     * The device automatically selects the network to which to register .
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_MODE_AUTOMATIC => 1

    /**
     * The device tries to register to a given network.
     * @type {Integer (Int32)}
     */
    static MBN_REGISTER_MODE_MANUAL => 2
}
