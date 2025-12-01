#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the state of a target.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_state
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TARGET_STATE extends Win32Enum{

    /**
     * The target state is unknown.
     * @type {Integer (Int32)}
     */
    static TARGET_UNKNOWN => 1

    /**
     * The target is initializing.
     * @type {Integer (Int32)}
     */
    static TARGET_INITIALIZING => 2

    /**
     * The target is running.
     * @type {Integer (Int32)}
     */
    static TARGET_RUNNING => 3

    /**
     * The target is not running. If a resource plug-in calls <b>OnStateChange</b> and the target is in this state, RD Connection Broker will delete the target object from its database.
     * @type {Integer (Int32)}
     */
    static TARGET_DOWN => 4

    /**
     * The target is hibernated.
     * @type {Integer (Int32)}
     */
    static TARGET_HIBERNATED => 5

    /**
     * The target is checked out.
     * @type {Integer (Int32)}
     */
    static TARGET_CHECKED_OUT => 6

    /**
     * The target is stopped.
     * @type {Integer (Int32)}
     */
    static TARGET_STOPPED => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_INVALID => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_STARTING => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_STOPPING => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TARGET_MAXSTATE => 11
}
