#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the state of a target.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_state
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TARGET_STATE extends Win32Enum {

    /**
     * The target state is unknown.
     * Native name: TARGET_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 1

    /**
     * The target is initializing.
     * Native name: TARGET_INITIALIZING
     * @type {Integer (Int32)}
     */
    static INITIALIZING => 2

    /**
     * The target is running.
     * Native name: TARGET_RUNNING
     * @type {Integer (Int32)}
     */
    static RUNNING => 3

    /**
     * The target is not running. If a resource plug-in calls <b>OnStateChange</b> and the target is in this state, RD Connection Broker will delete the target object from its database.
     * Native name: TARGET_DOWN
     * @type {Integer (Int32)}
     */
    static DOWN => 4

    /**
     * The target is hibernated.
     * Native name: TARGET_HIBERNATED
     * @type {Integer (Int32)}
     */
    static HIBERNATED => 5

    /**
     * The target is checked out.
     * Native name: TARGET_CHECKED_OUT
     * @type {Integer (Int32)}
     */
    static CHECKED_OUT => 6

    /**
     * The target is stopped.
     * Native name: TARGET_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 7

    /**
     * Native name: TARGET_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 8

    /**
     * Native name: TARGET_STARTING
     * @type {Integer (Int32)}
     */
    static STARTING => 9

    /**
     * Native name: TARGET_STOPPING
     * @type {Integer (Int32)}
     */
    static STOPPING => 10

    /**
     * Native name: TARGET_MAXSTATE
     * @type {Integer (Int32)}
     */
    static MAXSTATE => 11
}
