#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk

/**
 * Contains computer power policy settings that are unique to each power scheme on the computer.
 * @remarks
 * 
  * <b>DozeS4TimeoutAc</b> and <b>DozeS4TimeoutDc</b>  correspond to the <b>DozeS4Timeout</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_policy">SYSTEM_POWER_POLICY</a>. These values are merged from the machine power policy to the system power policy when the <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-setactivepwrscheme">SetActivePwrScheme</a> function is called to apply a power scheme.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//powrprof/ns-powrprof-machine_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class MACHINE_POWER_POLICY extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readpwrscheme">ReadPwrScheme</a> before using a <b>MACHINE_POWER_POLICY</b> structure to set power policy.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minimum system power state (lowest Sx value) to enter on a system sleep action when running on AC power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MinSleepAc {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The minimum system power state (lowest Sx value) to enter on a system sleep action when running on battery power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MinSleepDc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The maximum system power state (highest Sx value) to enter on a system sleep action when running on AC power, and when there are outstanding latency requirements. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. If an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with LT_LOWEST_LATENCY, <b>ReducedLatencySleepAc</b> is used in place of <b>MaxSleepAc</b>.
     * @type {Integer}
     */
    ReducedLatencySleepAc {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The maximum system power state (highest Sx value) to enter on a system sleep action when running on battery power, and when there are outstanding latency requirements. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. If an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with LT_LOWEST_LATENCY, <b>ReducedLatencySleepAc</b> is used in place of <b>MaxSleepAc</b>.
     * @type {Integer}
     */
    ReducedLatencySleepDc {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * This member is ignored.
     * @type {Integer}
     */
    DozeTimeoutAc {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This member is ignored.
     * @type {Integer}
     */
    DozeTimeoutDc {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Time to wait between entering the suspend state and entering the hibernate sleeping state when the system is running on AC power, in seconds. A value of zero indicates never hibernate.
     * @type {Integer}
     */
    DozeS4TimeoutAc {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Time to wait between entering the suspend state and entering the hibernate sleeping state when the system is running on battery power, in seconds. A value of zero indicates never hibernate.
     * @type {Integer}
     */
    DozeS4TimeoutDc {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The minimum throttle setting allowed before being overthrottled when the system is running on AC power. Thermal conditions would be the only reason for going below the minimum setting. When the processor is overthrottled, the system will initiate the <b>OverThrottledAc</b> policy. Note that the power policy manager has a hard-coded policy to initiate a CriticalShutdownOff whenever any thermal zone indicates a critical thermal condition. Range: 0-100.
     * @type {Integer}
     */
    MinThrottleAc {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * The minimum throttle setting allowed before being overthrottled when the system is running on battery power. Thermal conditions would be the only reason for going below the minimum setting. When the processor is overthrottled, the system will initiate the <b>OverThrottledDc</b> policy. Note that the power policy manager has a hard-coded policy to initiate a CriticalShutdownOff whenever any thermal zone indicates a critical thermal condition. Range: 0-100.
     * @type {Integer}
     */
    MinThrottleDc {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    pad1{
        get {
            if(!this.HasProp("__pad1ProxyArray"))
                this.__pad1ProxyArray := Win32FixedArray(this.ptr + 38, 2, Primitive, "char")
            return this.__pad1ProxyArray
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when a processor has become overthrottled (as defined by the <b>MinThrottleAc</b> member) when the system is running on AC power.
     * @type {POWER_ACTION_POLICY}
     */
    OverThrottledAc{
        get {
            if(!this.HasProp("__OverThrottledAc"))
                this.__OverThrottledAc := POWER_ACTION_POLICY(40, this)
            return this.__OverThrottledAc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when a processor has become overthrottled (as defined by the <b>MinThrottleDc</b> member) when the system is running on battery power.
     * @type {POWER_ACTION_POLICY}
     */
    OverThrottledDc{
        get {
            if(!this.HasProp("__OverThrottledDc"))
                this.__OverThrottledDc := POWER_ACTION_POLICY(56, this)
            return this.__OverThrottledDc
        }
    }
}
