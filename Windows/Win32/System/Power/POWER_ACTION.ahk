#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used to specify system power action types.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-power_action
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_ACTION extends Win32Enum{

    /**
     * No system power action.
     * @type {Integer (Int32)}
     */
    static PowerActionNone => 0

    /**
     * Reserved; do not use.
     * @type {Integer (Int32)}
     */
    static PowerActionReserved => 1

    /**
     * Sleep.
     * @type {Integer (Int32)}
     */
    static PowerActionSleep => 2

    /**
     * Hibernate.
     * @type {Integer (Int32)}
     */
    static PowerActionHibernate => 3

    /**
     * Shutdown.
     * @type {Integer (Int32)}
     */
    static PowerActionShutdown => 4

    /**
     * Shutdown and reset.
     * @type {Integer (Int32)}
     */
    static PowerActionShutdownReset => 5

    /**
     * Shutdown and power off.
     * @type {Integer (Int32)}
     */
    static PowerActionShutdownOff => 6

    /**
     * Warm eject.
     * @type {Integer (Int32)}
     */
    static PowerActionWarmEject => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PowerActionDisplayOff => 8
}
