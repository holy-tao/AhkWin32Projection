#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_REGISTER_MODE enumerated type indicates the network selection mode of a device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_register_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_REGISTER_MODE extends Win32Enum {

    /**
     * No network selection mode is defined.
     * Native name: MBN_REGISTER_MODE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The device automatically selects the network to which to register .
     * Native name: MBN_REGISTER_MODE_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static AUTOMATIC => 1

    /**
     * The device tries to register to a given network.
     * Native name: MBN_REGISTER_MODE_MANUAL
     * @type {Integer (Int32)}
     */
    static MANUAL => 2
}
