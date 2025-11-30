#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_STORAGE_ACCESS_CAPABILITY_VALUES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_ACCESS_CAPABILITY_READWRITE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITHOUT_OBJECT_DELETION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITH_OBJECT_DELETION => 2
}
