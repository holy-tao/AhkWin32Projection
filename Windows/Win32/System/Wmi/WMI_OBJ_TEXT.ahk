#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the valid object text formats to be used by SWbemObjectEx.GetText_.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wmi_obj_text
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WMI_OBJ_TEXT{

    /**
     * XML format conforming to the DMTF (Distributed Management Task Force) CIM document type definition (DTD) version 2.0.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_CIM_DTD_2_0 => 1

    /**
     * XML format as defined by the extended WMI version of DMTF CIM DTD version 2.0. Using this value enables WMI-specific extensions, such as embedded objects or scope.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_DTD_2_0 => 2

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT1 => 3

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT2 => 4

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT3 => 5

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT4 => 6

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT5 => 7

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT6 => 8

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT7 => 9

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT8 => 10

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT9 => 11

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_WMI_EXT10 => 12

    /**
     * Deprecated. Do not use.
     * @type {Integer (Int32)}
     */
    static WMI_OBJ_TEXT_LAST => 13
}
