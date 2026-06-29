#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that are used to specify system power states.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-system_power_state
 * @namespace Windows.Win32.System.Power
 */
export default struct SYSTEM_POWER_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unspecified system power state.
     * @type {Integer (Int32)}
     */
    static PowerSystemUnspecified => 0

    /**
     * Specifies system power state S0.
     * @type {Integer (Int32)}
     */
    static PowerSystemWorking => 1

    /**
     * Specifies system power state S1.
     * @type {Integer (Int32)}
     */
    static PowerSystemSleeping1 => 2

    /**
     * Specifies system power state S2.
     * @type {Integer (Int32)}
     */
    static PowerSystemSleeping2 => 3

    /**
     * Specifies system power state S3.
     * @type {Integer (Int32)}
     */
    static PowerSystemSleeping3 => 4

    /**
     * Specifies system power state S4 (HIBERNATE).
     * @type {Integer (Int32)}
     */
    static PowerSystemHibernate => 5

    /**
     * Specifies system power state S5 (OFF).
     * @type {Integer (Int32)}
     */
    static PowerSystemShutdown => 6

    /**
     * Specifies the maximum enumeration value.
     * @type {Integer (Int32)}
     */
    static PowerSystemMaximum => 7
}
