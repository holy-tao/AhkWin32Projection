#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_GET_DEVICE_INTERFACE_LIST_FLAGS extends Win32Enum {

    /**
     * Native name: CM_GET_DEVICE_INTERFACE_LIST_PRESENT
     * @type {Integer (UInt32)}
     */
    static PRESENT => 0

    /**
     * Native name: CM_GET_DEVICE_INTERFACE_LIST_ALL_DEVICES
     * @type {Integer (UInt32)}
     */
    static ALL_DEVICES => 1

    /**
     * Native name: CM_GET_DEVICE_INTERFACE_LIST_BITS
     * @type {Integer (UInt32)}
     */
    static BITS => 1
}
