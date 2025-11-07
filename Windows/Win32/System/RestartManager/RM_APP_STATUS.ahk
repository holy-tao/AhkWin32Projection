#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the current status of an application that is acted upon by the Restart Manager.
 * @remarks
 * 
 * The constants  of <b>RM_APP_STATUS</b> can be combined with OR operators. The combination describes the history of actions taken by Restart Manager on the application.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//restartmanager/ne-restartmanager-rm_app_status
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_APP_STATUS{

    /**
     * The application is in a state that is not described by any other enumerated state.
     * @type {Integer (Int32)}
     */
    static RmStatusUnknown => 0

    /**
     * The application is currently running.
     * @type {Integer (Int32)}
     */
    static RmStatusRunning => 1

    /**
     * The Restart Manager has stopped the application.
     * @type {Integer (Int32)}
     */
    static RmStatusStopped => 2

    /**
     * An action outside the Restart Manager has stopped the application.
     * @type {Integer (Int32)}
     */
    static RmStatusStoppedOther => 4

    /**
     * The Restart Manager has restarted the application.
     * @type {Integer (Int32)}
     */
    static RmStatusRestarted => 8

    /**
     * The Restart Manager encountered an error when stopping the application.
     * @type {Integer (Int32)}
     */
    static RmStatusErrorOnStop => 16

    /**
     * The Restart Manager encountered an error when restarting the application.
     * @type {Integer (Int32)}
     */
    static RmStatusErrorOnRestart => 32

    /**
     * Shutdown is masked by a filter.
     * @type {Integer (Int32)}
     */
    static RmStatusShutdownMasked => 64

    /**
     * Restart is masked by a filter.
     * @type {Integer (Int32)}
     */
    static RmStatusRestartMasked => 128
}
