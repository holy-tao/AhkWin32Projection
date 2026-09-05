#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_STORAGE\_TYPE\_VALUES enumeration type describes the different Windows Portable Device storage types.
 * @remarks
 * None.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-storage-type-values
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_STORAGE_TYPE_VALUES extends Win32Enum {

    /**
     * Native name: WPD_STORAGE_TYPE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: WPD_STORAGE_TYPE_FIXED_ROM
     * @type {Integer (Int32)}
     */
    static FIXED_ROM => 1

    /**
     * Native name: WPD_STORAGE_TYPE_REMOVABLE_ROM
     * @type {Integer (Int32)}
     */
    static REMOVABLE_ROM => 2

    /**
     * Native name: WPD_STORAGE_TYPE_FIXED_RAM
     * @type {Integer (Int32)}
     */
    static FIXED_RAM => 3

    /**
     * Native name: WPD_STORAGE_TYPE_REMOVABLE_RAM
     * @type {Integer (Int32)}
     */
    static REMOVABLE_RAM => 4
}
