#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_TASK_TYPE extends Win32Enum {

    /**
     * Native name: PM_TASK_TYPE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: PM_TASK_TYPE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: PM_TASK_TYPE_SETTINGS
     * @type {Integer (Int32)}
     */
    static SETTINGS => 2

    /**
     * Native name: PM_TASK_TYPE_BACKGROUNDSERVICEAGENT
     * @type {Integer (Int32)}
     */
    static BACKGROUNDSERVICEAGENT => 3

    /**
     * Native name: PM_TASK_TYPE_BACKGROUNDWORKER
     * @type {Integer (Int32)}
     */
    static BACKGROUNDWORKER => 4

    /**
     * Native name: PM_TASK_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 5
}
