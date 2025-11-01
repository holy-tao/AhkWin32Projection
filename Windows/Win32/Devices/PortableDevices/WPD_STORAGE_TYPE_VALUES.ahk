#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-storage-type-values
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_STORAGE_TYPE_VALUES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_FIXED_ROM => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_REMOVABLE_ROM => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_FIXED_RAM => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_REMOVABLE_RAM => 4
}
