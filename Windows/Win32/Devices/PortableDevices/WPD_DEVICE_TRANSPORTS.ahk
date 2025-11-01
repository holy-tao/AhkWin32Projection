#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-device-transports
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_DEVICE_TRANSPORTS{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TRANSPORT_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TRANSPORT_USB => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TRANSPORT_IP => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TRANSPORT_BLUETOOTH => 3
}
