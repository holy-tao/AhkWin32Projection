#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import ".\SYSTEM_POWER_LEVEL.ahk" { SYSTEM_POWER_LEVEL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }

/**
 * Contains information about the current system power policy.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct SYSTEM_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision.
     */
    Revision : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system power button is pressed.
     */
    PowerButton : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system sleep button is pressed.
     */
    SleepButton : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system lid switch is closed.
     */
    LidClose : POWER_ACTION_POLICY

    /**
     * The maximum power state (highest Sx value) from which a lid-open event should wake the system. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    LidOpenWake : SYSTEM_POWER_STATE

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system idle timer expires.
     */
    Idle : POWER_ACTION_POLICY

    /**
     * The time that the level of system activity must remain below the idle detection threshold before the system idle timer expires, in seconds.
     */
    IdleTimeout : UInt32

    /**
     * The level of system activity that defines the threshold for idle detection, expressed as a percentage.
     */
    IdleSensitivity : Int8

    /**
     * The current system processor dynamic throttling policy. This member must be one of the values described in 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/processor-performance-control-policy-constants">Processor Performance Control Policy Constants</a>.
     */
    DynamicThrottle : Int8

    /**
     * Reserved.
     */
    Spare2 : Int8[2]

    /**
     * The minimum system sleep state (lowest Sx value) currently supported. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MinSleep : SYSTEM_POWER_STATE

    /**
     * The maximum system sleep state (highest Sx value) currently supported. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MaxSleep : SYSTEM_POWER_STATE

    /**
     * The system power state (Sx value) to enter on a system sleep action when there are outstanding latency requirements. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. If an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with LT_LOWEST_LATENCY, <b>ReducedLatencySleep</b> will be used in place of <b>MaxSleep</b>.
     */
    ReducedLatencySleep : SYSTEM_POWER_STATE

    /**
     * This member can be zero or WINLOGON_LOCK_ON_SLEEP (0x00000001).
     */
    WinLogonFlags : UInt32

    /**
     * Reserved.
     */
    Spare3 : UInt32

    /**
     * The time to wait between entering the suspend state and entering the hibernate sleeping state, in seconds. A value of zero indicates never hibernate.
     */
    DozeS4Timeout : UInt32

    /**
     * The resolution of change in current battery capacity that should cause the system to be notified of a system power state changed event.
     */
    BroadcastCapacityResolution : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_level">SYSTEM_POWER_LEVEL</a> structures that defines the actions to take at system battery discharge events.
     */
    DischargePolicy : SYSTEM_POWER_LEVEL[4]

    /**
     * The time before the display is turned off, in seconds.
     */
    VideoTimeout : UInt32

    /**
     * If this member is <b>TRUE</b>, the system includes support for display dimming.
     */
    VideoDimDisplay : BOOLEAN

    /**
     * Reserved.
     */
    VideoReserved : UInt32[3]

    /**
     * The time before power to fixed disk drives is turned off, in seconds.
     */
    SpindownTimeout : UInt32

    /**
     * If this member is <b>TRUE</b>, the system will turn on cooling fans and run the processor at full speed when passive cooling is specified. This causes the operating system to be biased toward using the fan and running the processor at full speed.
     */
    OptimizeForPower : BOOLEAN

    /**
     * The lower limit that the processor may be throttled down to prior to turning on system fans in response to a thermal event, expressed as a percentage.
     */
    FanThrottleTolerance : Int8

    /**
     * The processor throttle level to be imposed by the system, expressed as a percentage.
     */
    ForcedThrottle : Int8

    /**
     * The minimum processor throttle level, expressed as a percentage.
     */
    MinThrottle : Int8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate in response to a thermal event when processor throttling is unable to adequately reduce the system temperature.
     */
    OverThrottled : POWER_ACTION_POLICY

}
