#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_DEVICE\_TRANSPORTS enumeration type specifies the inheritance relationship for a service. This enumeration is used by the WPD\_DEVICE\_TRANSPORT property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-device-transports
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_DEVICE_TRANSPORTS extends Win32Enum {

    /**
     * Native name: WPD_DEVICE_TRANSPORT_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static TRANSPORT_UNSPECIFIED => 0

    /**
     * Native name: WPD_DEVICE_TRANSPORT_USB
     * @type {Integer (Int32)}
     */
    static TRANSPORT_USB => 1

    /**
     * Native name: WPD_DEVICE_TRANSPORT_IP
     * @type {Integer (Int32)}
     */
    static TRANSPORT_IP => 2

    /**
     * Native name: WPD_DEVICE_TRANSPORT_BLUETOOTH
     * @type {Integer (Int32)}
     */
    static TRANSPORT_BLUETOOTH => 3
}
