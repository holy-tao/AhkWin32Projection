#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used to specify system power action types.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-power_action
 * @namespace Windows.Win32.System.Power
 */
class POWER_ACTION extends Win32Enum {

    /**
     * No system power action.
     * Native name: PowerActionNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Reserved; do not use.
     * Native name: PowerActionReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 1

    /**
     * Sleep.
     * Native name: PowerActionSleep
     * @type {Integer (Int32)}
     */
    static Sleep => 2

    /**
     * Hibernate.
     * Native name: PowerActionHibernate
     * @type {Integer (Int32)}
     */
    static Hibernate => 3

    /**
     * Shutdown.
     * Native name: PowerActionShutdown
     * @type {Integer (Int32)}
     */
    static Shutdown => 4

    /**
     * Shutdown and reset.
     * Native name: PowerActionShutdownReset
     * @type {Integer (Int32)}
     */
    static ShutdownReset => 5

    /**
     * Shutdown and power off.
     * Native name: PowerActionShutdownOff
     * @type {Integer (Int32)}
     */
    static ShutdownOff => 6

    /**
     * Warm eject.
     * Native name: PowerActionWarmEject
     * @type {Integer (Int32)}
     */
    static WarmEject => 7

    /**
     * Native name: PowerActionDisplayOff
     * @type {Integer (Int32)}
     */
    static DisplayOff => 8
}
