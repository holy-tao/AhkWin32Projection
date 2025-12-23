#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_SORTDESCRIPTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_GENERAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_A_Z => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_LOWEST_HIGHEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_SMALLEST_BIGGEST => 3

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_OLDEST_NEWEST => 4
}
