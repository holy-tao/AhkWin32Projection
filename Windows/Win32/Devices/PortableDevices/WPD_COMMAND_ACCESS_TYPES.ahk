#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_COMMAND_ACCESS_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_READWRITE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_STGM_ACCESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_FROM_PROPERTY_WITH_FILE_ACCESS => 8

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COMMAND_ACCESS_FROM_ATTRIBUTE_WITH_METHOD_ACCESS => 16
}
