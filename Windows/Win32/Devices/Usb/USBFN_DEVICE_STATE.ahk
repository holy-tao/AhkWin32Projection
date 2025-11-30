#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_DEVICE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateMinimum => 0

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateAttached => 1

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateDefault => 2

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateDetached => 3

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateAddressed => 4

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateConfigured => 5

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateSuspended => 6

    /**
     * @type {Integer (Int32)}
     */
    static UsbfnDeviceStateStateMaximum => 7
}
