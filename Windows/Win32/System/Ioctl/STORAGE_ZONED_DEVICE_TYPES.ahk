#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ZONED_DEVICE_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeHostManaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeHostAware => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZonedDeviceTypeDeviceManaged => 3
}
