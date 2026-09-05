#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_STORAGE_ACCESS_CAPABILITY_VALUES extends Win32Enum {

    /**
     * Native name: WPD_STORAGE_ACCESS_CAPABILITY_READWRITE
     * @type {Integer (Int32)}
     */
    static READWRITE => 0

    /**
     * Native name: WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITHOUT_OBJECT_DELETION
     * @type {Integer (Int32)}
     */
    static READ_ONLY_WITHOUT_OBJECT_DELETION => 1

    /**
     * Native name: WPD_STORAGE_ACCESS_CAPABILITY_READ_ONLY_WITH_OBJECT_DELETION
     * @type {Integer (Int32)}
     */
    static READ_ONLY_WITH_OBJECT_DELETION => 2
}
