#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_TASK_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_SETTINGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_BACKGROUNDSERVICEAGENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_BACKGROUNDWORKER => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TYPE_INVALID => 5
}
