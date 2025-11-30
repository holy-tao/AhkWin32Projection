#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the running status of the data collector set.
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-datacollectorsetstatus
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DataCollectorSetStatus extends Win32Enum{

    /**
     * The data collector set is not running.
     * @type {Integer (Int32)}
     */
    static plaStopped => 0

    /**
     * The data collector set is running.
     * @type {Integer (Int32)}
     */
    static plaRunning => 1

    /**
     * The data collector set is performing data management. A running data collector set will transition from <b>plaRunning</b> to <b>plaCompiling</b> if the data manager is enabled.
     * @type {Integer (Int32)}
     */
    static plaCompiling => 2

    /**
     * The data collector has been set to run, but the service has not started it yet.  Only computers that run operating systems prior to Windows Vista report this status.
     * @type {Integer (Int32)}
     */
    static plaPending => 3

    /**
     * Cannot determine the status but no error has occurred. Typically, this status is set for autologgers.
     * @type {Integer (Int32)}
     */
    static plaUndefined => 4
}
