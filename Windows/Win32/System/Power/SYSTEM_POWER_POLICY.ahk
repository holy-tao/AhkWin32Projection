#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk
#Include .\SYSTEM_POWER_LEVEL.ahk

/**
 * Contains information about the current system power policy.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_POWER_POLICY extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * The current structure revision.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system power button is pressed.
     * @type {POWER_ACTION_POLICY}
     */
    PowerButton{
        get {
            if(!this.HasProp("__PowerButton"))
                this.__PowerButton := POWER_ACTION_POLICY(this.ptr + 8)
            return this.__PowerButton
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system sleep button is pressed.
     * @type {POWER_ACTION_POLICY}
     */
    SleepButton{
        get {
            if(!this.HasProp("__SleepButton"))
                this.__SleepButton := POWER_ACTION_POLICY(this.ptr + 24)
            return this.__SleepButton
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system lid switch is closed.
     * @type {POWER_ACTION_POLICY}
     */
    LidClose{
        get {
            if(!this.HasProp("__LidClose"))
                this.__LidClose := POWER_ACTION_POLICY(this.ptr + 40)
            return this.__LidClose
        }
    }

    /**
     * The maximum power state (highest Sx value) from which a lid-open event should wake the system. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    LidOpenWake {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system idle timer expires.
     * @type {POWER_ACTION_POLICY}
     */
    Idle{
        get {
            if(!this.HasProp("__Idle"))
                this.__Idle := POWER_ACTION_POLICY(this.ptr + 64)
            return this.__Idle
        }
    }

    /**
     * The time that the level of system activity must remain below the idle detection threshold before the system idle timer expires, in seconds.
     * @type {Integer}
     */
    IdleTimeout {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The level of system activity that defines the threshold for idle detection, expressed as a percentage.
     * @type {Integer}
     */
    IdleSensitivity {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }

    /**
     * The current system processor dynamic throttling policy. This member must be one of the values described in 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/processor-performance-control-policy-constants">Processor Performance Control Policy Constants</a>.
     * @type {Integer}
     */
    DynamicThrottle {
        get => NumGet(this, 81, "char")
        set => NumPut("char", value, this, 81)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Spare2{
        get {
            if(!this.HasProp("__Spare2ProxyArray"))
                this.__Spare2ProxyArray := Win32FixedArray(this.ptr + 82, 2, Primitive, "char")
            return this.__Spare2ProxyArray
        }
    }

    /**
     * The minimum system sleep state (lowest Sx value) currently supported. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MinSleep {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * The maximum system sleep state (highest Sx value) currently supported. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MaxSleep {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * The system power state (Sx value) to enter on a system sleep action when there are outstanding latency requirements. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. If an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with LT_LOWEST_LATENCY, <b>ReducedLatencySleep</b> will be used in place of <b>MaxSleep</b>.
     * @type {Integer}
     */
    ReducedLatencySleep {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * This member can be zero or WINLOGON_LOCK_ON_SLEEP (0x00000001).
     * @type {Integer}
     */
    WinLogonFlags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Spare3 {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The time to wait between entering the suspend state and entering the hibernate sleeping state, in seconds. A value of zero indicates never hibernate.
     * @type {Integer}
     */
    DozeS4Timeout {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The resolution of change in current battery capacity that should cause the system to be notified of a system power state changed event.
     * @type {Integer}
     */
    BroadcastCapacityResolution {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_level">SYSTEM_POWER_LEVEL</a> structures that defines the actions to take at system battery discharge events.
     * @type {Array<SYSTEM_POWER_LEVEL>}
     */
    DischargePolicy{
        get {
            if(!this.HasProp("__DischargePolicyProxyArray"))
                this.__DischargePolicyProxyArray := Win32FixedArray(this.ptr + 112, 4, SYSTEM_POWER_LEVEL, "")
            return this.__DischargePolicyProxyArray
        }
    }

    /**
     * The time before the display is turned off, in seconds.
     * @type {Integer}
     */
    VideoTimeout {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * If this member is <b>TRUE</b>, the system includes support for display dimming.
     * @type {Integer}
     */
    VideoDimDisplay {
        get => NumGet(this, 148, "char")
        set => NumPut("char", value, this, 148)
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    VideoReserved{
        get {
            if(!this.HasProp("__VideoReservedProxyArray"))
                this.__VideoReservedProxyArray := Win32FixedArray(this.ptr + 152, 3, Primitive, "uint")
            return this.__VideoReservedProxyArray
        }
    }

    /**
     * The time before power to fixed disk drives is turned off, in seconds.
     * @type {Integer}
     */
    SpindownTimeout {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * If this member is <b>TRUE</b>, the system will turn on cooling fans and run the processor at full speed when passive cooling is specified. This causes the operating system to be biased toward using the fan and running the processor at full speed.
     * @type {Integer}
     */
    OptimizeForPower {
        get => NumGet(this, 168, "char")
        set => NumPut("char", value, this, 168)
    }

    /**
     * The lower limit that the processor may be throttled down to prior to turning on system fans in response to a thermal event, expressed as a percentage.
     * @type {Integer}
     */
    FanThrottleTolerance {
        get => NumGet(this, 169, "char")
        set => NumPut("char", value, this, 169)
    }

    /**
     * The processor throttle level to be imposed by the system, expressed as a percentage.
     * @type {Integer}
     */
    ForcedThrottle {
        get => NumGet(this, 170, "char")
        set => NumPut("char", value, this, 170)
    }

    /**
     * The minimum processor throttle level, expressed as a percentage.
     * @type {Integer}
     */
    MinThrottle {
        get => NumGet(this, 171, "char")
        set => NumPut("char", value, this, 171)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate in response to a thermal event when processor throttling is unable to adequately reduce the system temperature.
     * @type {POWER_ACTION_POLICY}
     */
    OverThrottled{
        get {
            if(!this.HasProp("__OverThrottled"))
                this.__OverThrottled := POWER_ACTION_POLICY(this.ptr + 176)
            return this.__OverThrottled
        }
    }
}
