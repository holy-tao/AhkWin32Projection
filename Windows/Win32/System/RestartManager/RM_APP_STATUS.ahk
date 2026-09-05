#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the current status of an application that is acted upon by the Restart Manager.
 * @remarks
 * The constants  of <b>RM_APP_STATUS</b> can be combined with OR operators. The combination describes the history of actions taken by Restart Manager on the application.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ne-restartmanager-rm_app_status
 * @namespace Windows.Win32.System.RestartManager
 */
class RM_APP_STATUS extends Win32Enum {

    /**
     * The application is in a state that is not described by any other enumerated state.
     * Native name: RmStatusUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The application is currently running.
     * Native name: RmStatusRunning
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * The Restart Manager has stopped the application.
     * Native name: RmStatusStopped
     * @type {Integer (Int32)}
     */
    static Stopped => 2

    /**
     * An action outside the Restart Manager has stopped the application.
     * Native name: RmStatusStoppedOther
     * @type {Integer (Int32)}
     */
    static StoppedOther => 4

    /**
     * The Restart Manager has restarted the application.
     * Native name: RmStatusRestarted
     * @type {Integer (Int32)}
     */
    static Restarted => 8

    /**
     * The Restart Manager encountered an error when stopping the application.
     * Native name: RmStatusErrorOnStop
     * @type {Integer (Int32)}
     */
    static ErrorOnStop => 16

    /**
     * The Restart Manager encountered an error when restarting the application.
     * Native name: RmStatusErrorOnRestart
     * @type {Integer (Int32)}
     */
    static ErrorOnRestart => 32

    /**
     * Shutdown is masked by a filter.
     * Native name: RmStatusShutdownMasked
     * @type {Integer (Int32)}
     */
    static ShutdownMasked => 64

    /**
     * Restart is masked by a filter.
     * Native name: RmStatusRestartMasked
     * @type {Integer (Int32)}
     */
    static RestartMasked => 128
}
