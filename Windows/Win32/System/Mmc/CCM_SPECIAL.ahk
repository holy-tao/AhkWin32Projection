#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class CCM_SPECIAL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_SEPARATOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_SUBMENU => 2

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_DEFAULT_ITEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_INSERTION_POINT => 8

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_TESTONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_ELEVATION_ICON => 32
}
