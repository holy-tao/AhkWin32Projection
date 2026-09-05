#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class RD_FARM_TYPE extends Win32Enum {

    /**
     * Native name: RD_FARM_RDSH
     * @type {Integer (Int32)}
     */
    static RDSH => 0

    /**
     * Native name: RD_FARM_TEMP_VM
     * @type {Integer (Int32)}
     */
    static TEMP_VM => 1

    /**
     * Native name: RD_FARM_MANUAL_PERSONAL_VM
     * @type {Integer (Int32)}
     */
    static MANUAL_PERSONAL_VM => 2

    /**
     * Native name: RD_FARM_AUTO_PERSONAL_VM
     * @type {Integer (Int32)}
     */
    static AUTO_PERSONAL_VM => 3

    /**
     * Native name: RD_FARM_MANUAL_PERSONAL_RDSH
     * @type {Integer (Int32)}
     */
    static MANUAL_PERSONAL_RDSH => 4

    /**
     * Native name: RD_FARM_AUTO_PERSONAL_RDSH
     * @type {Integer (Int32)}
     */
    static AUTO_PERSONAL_RDSH => 5

    /**
     * Native name: RD_FARM_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1
}
