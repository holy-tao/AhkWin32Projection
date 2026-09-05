#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ZONED_DEVICE_TYPES extends Win32Enum {

    /**
     * Native name: ZonedDeviceTypeUnknown
     * @type {Integer (Int32)}
     */
    static TypeUnknown => 0

    /**
     * Native name: ZonedDeviceTypeHostManaged
     * @type {Integer (Int32)}
     */
    static TypeHostManaged => 1

    /**
     * Native name: ZonedDeviceTypeHostAware
     * @type {Integer (Int32)}
     */
    static TypeHostAware => 2

    /**
     * Native name: ZonedDeviceTypeDeviceManaged
     * @type {Integer (Int32)}
     */
    static TypeDeviceManaged => 3
}
