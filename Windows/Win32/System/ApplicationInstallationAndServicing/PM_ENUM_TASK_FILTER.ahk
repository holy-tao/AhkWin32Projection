#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_TASK_FILTER extends Win32Enum {

    /**
     * Native name: PM_TASK_FILTER_APP_ALL
     * @type {Integer (Int32)}
     */
    static APP_ALL => 12

    /**
     * Native name: PM_TASK_FILTER_TASK_TYPE
     * @type {Integer (Int32)}
     */
    static TASK_TYPE => 13

    /**
     * Native name: PM_TASK_FILTER_DEHYD_SUPRESSING
     * @type {Integer (Int32)}
     */
    static DEHYD_SUPRESSING => 14

    /**
     * Native name: PM_TASK_FILTER_APP_TASK_TYPE
     * @type {Integer (Int32)}
     */
    static APP_TASK_TYPE => 15

    /**
     * Native name: PM_TASK_FILTER_BGEXECUTION
     * @type {Integer (Int32)}
     */
    static BGEXECUTION => 16

    /**
     * Native name: PM_TASK_FILTER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 17
}
