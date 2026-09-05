#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_COMMAND_ACCESS_TYPES extends Win32Enum {

    /**
     * Native name: WPD_COMMAND_ACCESS_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Native name: WPD_COMMAND_ACCESS_READWRITE
     * @type {Integer (Int32)}
     */
    static READWRITE => 3

    /**
     * Native name: WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_STGM_ACCESS
     * @type {Integer (Int32)}
     */
    static FROM_PROPERTY_WITH_STGM_ACCESS => 4

    /**
     * Native name: WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_FILE_ACCESS
     * @type {Integer (Int32)}
     */
    static FROM_PROPERTY_WITH_FILE_ACCESS => 8

    /**
     * Native name: WPD_COMMAND_ACCESS_FROM_ATTRIBUTE_WITH_METHOD_ACCESS
     * @type {Integer (Int32)}
     */
    static FROM_ATTRIBUTE_WITH_METHOD_ACCESS => 16
}
