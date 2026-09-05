#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used to specify system power states.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-system_power_state
 * @namespace Windows.Win32.System.Power
 */
class SYSTEM_POWER_STATE extends Win32Enum {

    /**
     * Unspecified system power state.
     * Native name: PowerSystemUnspecified
     * @type {Integer (Int32)}
     */
    static SystemUnspecified => 0

    /**
     * Specifies system power state S0.
     * Native name: PowerSystemWorking
     * @type {Integer (Int32)}
     */
    static SystemWorking => 1

    /**
     * Specifies system power state S1.
     * Native name: PowerSystemSleeping1
     * @type {Integer (Int32)}
     */
    static SystemSleeping1 => 2

    /**
     * Specifies system power state S2.
     * Native name: PowerSystemSleeping2
     * @type {Integer (Int32)}
     */
    static SystemSleeping2 => 3

    /**
     * Specifies system power state S3.
     * Native name: PowerSystemSleeping3
     * @type {Integer (Int32)}
     */
    static SystemSleeping3 => 4

    /**
     * Specifies system power state S4 (HIBERNATE).
     * Native name: PowerSystemHibernate
     * @type {Integer (Int32)}
     */
    static SystemHibernate => 5

    /**
     * Specifies system power state S5 (OFF).
     * Native name: PowerSystemShutdown
     * @type {Integer (Int32)}
     */
    static SystemShutdown => 6

    /**
     * Specifies the maximum enumeration value.
     * Native name: PowerSystemMaximum
     * @type {Integer (Int32)}
     */
    static SystemMaximum => 7
}
