#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_BSA_FILTER extends Win32Enum {

    /**
     * Native name: PM_ENUM_BSA_FILTER_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 26

    /**
     * Native name: PM_ENUM_BSA_FILTER_BY_TASKID
     * @type {Integer (Int32)}
     */
    static BY_TASKID => 27

    /**
     * Native name: PM_ENUM_BSA_FILTER_BY_PRODUCTID
     * @type {Integer (Int32)}
     */
    static BY_PRODUCTID => 28

    /**
     * Native name: PM_ENUM_BSA_FILTER_BY_PERIODIC
     * @type {Integer (Int32)}
     */
    static BY_PERIODIC => 29

    /**
     * Native name: PM_ENUM_BSA_FILTER_BY_ALL_LAUNCHONBOOT
     * @type {Integer (Int32)}
     */
    static BY_ALL_LAUNCHONBOOT => 30

    /**
     * Native name: PM_ENUM_BSA_FILTER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 31
}
