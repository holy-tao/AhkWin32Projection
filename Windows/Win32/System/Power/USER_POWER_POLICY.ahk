#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Contains power policy settings that are unique to each power scheme for a user.
 * @see https://docs.microsoft.com/windows/win32/api//powrprof/ns-powrprof-user_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class USER_POWER_POLICY extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readpwrscheme">ReadPwrScheme</a> before using a <b>USER_POWER_POLICY</b> structure to set power policy.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system is running on AC (utility) power and the system idle timer expires.
     * @type {POWER_ACTION_POLICY}
     */
    IdleAc{
        get {
            if(!this.HasProp("__IdleAc"))
                this.__IdleAc := POWER_ACTION_POLICY(this.ptr + 8)
            return this.__IdleAc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system is running on battery power and the system idle timer expires.
     * @type {POWER_ACTION_POLICY}
     */
    IdleDc{
        get {
            if(!this.HasProp("__IdleDc"))
                this.__IdleDc := POWER_ACTION_POLICY(this.ptr + 24)
            return this.__IdleDc
        }
    }

    /**
     * The time that the level of system activity must remain below the idle detection threshold before the system idle timer expires when running on AC (utility) power, in seconds.
     * 
     * This member is ignored if the system is performing an automated resume because there is no user present. To temporarily keep the system running while an application is performing a task, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a> function.
     * @type {Integer}
     */
    IdleTimeoutAc {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The time that the level of system activity must remain below the idle detection threshold before the system idle timer expires when running on battery power, in seconds.
     * 
     * This member is ignored if the system is performing an automated resume because there is no user present. To temporarily keep the system running while an application is performing a task, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a> function.
     * @type {Integer}
     */
    IdleTimeoutDc {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The level of system activity that defines the threshold for idle detection when the system is running on AC (utility) power, expressed as a percentage.
     * @type {Integer}
     */
    IdleSensitivityAc {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * The level of system activity that defines the threshold for idle detection when the system is running on battery power, expressed as a percentage.
     * @type {Integer}
     */
    IdleSensitivityDc {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * The processor dynamic throttling policy to use when the system is running on AC (utility) power.
     * @type {Integer}
     */
    ThrottlePolicyAc {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * The processor dynamic throttling policy to use when the system is running on battery power.
     * @type {Integer}
     */
    ThrottlePolicyDc {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * The maximum system sleep state when the system is running on AC (utility) power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MaxSleepAc {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * The maximum system sleep state when the system is running on battery power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MaxSleepDc {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 56, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The time before the display is turned off when the system is running on AC (utility) power, in seconds.
     * @type {Integer}
     */
    VideoTimeoutAc {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The time before the display is turned off when the system is running on battery power, in seconds.
     * @type {Integer}
     */
    VideoTimeoutDc {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The time before power to fixed disk drives is turned off when the system is running on AC (utility) power, in seconds.
     * @type {Integer}
     */
    SpindownTimeoutAc {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The time before power to fixed disk drives is turned off when the system is running on battery power, in seconds.
     * @type {Integer}
     */
    SpindownTimeoutDc {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * If this member is <b>TRUE</b>, the system will turn on cooling fans and run the processor at full speed when passive cooling is specified and the system is running on AC (utility) power. This causes the operating system to be biased toward using the fan and running the processor at full speed.
     * @type {BOOLEAN}
     */
    OptimizeForPowerAc{
        get {
            if(!this.HasProp("__OptimizeForPowerAc"))
                this.__OptimizeForPowerAc := BOOLEAN(this.ptr + 80)
            return this.__OptimizeForPowerAc
        }
    }

    /**
     * If this member is <b>TRUE</b>, the system will turn on cooling fans and run the processor at full speed when passive cooling is specified and the system is running on battery power. This causes the operating system to be biased toward using the fan and running the processor at full speed.
     * @type {BOOLEAN}
     */
    OptimizeForPowerDc{
        get {
            if(!this.HasProp("__OptimizeForPowerDc"))
                this.__OptimizeForPowerDc := BOOLEAN(this.ptr + 81)
            return this.__OptimizeForPowerDc
        }
    }

    /**
     * The lower limit that the processor may be throttled down to prior to turning on system fans in response to a thermal event while the system is operating on AC (utility) power, expressed as a percentage.
     * @type {Integer}
     */
    FanThrottleToleranceAc {
        get => NumGet(this, 82, "char")
        set => NumPut("char", value, this, 82)
    }

    /**
     * The lower limit that the processor may be throttled down to prior to turning on system fans in response to a thermal event while the system is operating on battery power, expressed as a percentage.
     * @type {Integer}
     */
    FanThrottleToleranceDc {
        get => NumGet(this, 83, "char")
        set => NumPut("char", value, this, 83)
    }

    /**
     * The processor throttle level to be imposed by the system while the computer is running on AC (utility) power, expressed as a percentage.
     * @type {Integer}
     */
    ForcedThrottleAc {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }

    /**
     * The processor throttle level to be imposed by the system while the computer is running on battery power, expressed as a percentage.
     * @type {Integer}
     */
    ForcedThrottleDc {
        get => NumGet(this, 85, "char")
        set => NumPut("char", value, this, 85)
    }
}
