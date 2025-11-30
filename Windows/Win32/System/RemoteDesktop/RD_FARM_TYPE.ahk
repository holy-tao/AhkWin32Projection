#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RD_FARM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_RDSH => 0

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_TEMP_VM => 1

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_MANUAL_PERSONAL_VM => 2

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_AUTO_PERSONAL_VM => 3

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_MANUAL_PERSONAL_RDSH => 4

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_AUTO_PERSONAL_RDSH => 5

    /**
     * @type {Integer (Int32)}
     */
    static RD_FARM_TYPE_UNKNOWN => -1
}
