#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_DEVICE_STATE extends Win32Enum {

    /**
     * Native name: UsbfnDeviceStateMinimum
     * @type {Integer (Int32)}
     */
    static Minimum => 0

    /**
     * Native name: UsbfnDeviceStateAttached
     * @type {Integer (Int32)}
     */
    static Attached => 1

    /**
     * Native name: UsbfnDeviceStateDefault
     * @type {Integer (Int32)}
     */
    static Default => 2

    /**
     * Native name: UsbfnDeviceStateDetached
     * @type {Integer (Int32)}
     */
    static Detached => 3

    /**
     * Native name: UsbfnDeviceStateAddressed
     * @type {Integer (Int32)}
     */
    static Addressed => 4

    /**
     * Native name: UsbfnDeviceStateConfigured
     * @type {Integer (Int32)}
     */
    static Configured => 5

    /**
     * Native name: UsbfnDeviceStateSuspended
     * @type {Integer (Int32)}
     */
    static Suspended => 6

    /**
     * Native name: UsbfnDeviceStateStateMaximum
     * @type {Integer (Int32)}
     */
    static StateMaximum => 7
}
