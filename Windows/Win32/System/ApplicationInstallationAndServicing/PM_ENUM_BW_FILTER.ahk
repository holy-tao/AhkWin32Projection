#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_BW_FILTER extends Win32Enum {

    /**
     * Native name: PM_ENUM_BW_FILTER_BOOTWORKER_ALL
     * @type {Integer (Int32)}
     */
    static BOOTWORKER_ALL => 31

    /**
     * Native name: PM_ENUM_BW_FILTER_BY_TASKID
     * @type {Integer (Int32)}
     */
    static BY_TASKID => 32

    /**
     * Native name: PM_ENUM_BW_FILTER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 33
}
