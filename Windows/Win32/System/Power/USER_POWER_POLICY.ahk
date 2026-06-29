#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }

/**
 * Contains power policy settings that are unique to each power scheme for a user.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-user_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct USER_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readpwrscheme">ReadPwrScheme</a> before using a <b>USER_POWER_POLICY</b> structure to set power policy.
     */
    Revision : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system is running on AC (utility) power and the system idle timer expires.
     */
    IdleAc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the system power action to initiate when the system is running on battery power and the system idle timer expires.
     */
    IdleDc : POWER_ACTION_POLICY

    /**
     * The time that the level of system activity must remain below the idle detection threshold before the system idle timer expires when running on AC (utility) power, in seconds.
     * 
     * This member is ignored if the system is performing an automated resume because there is no user present. To temporarily keep the system running while an application is performing a task, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a> function.
     */
    IdleTimeoutAc : UInt32

    /**
     * The time that the level of system activity must remain below the idle detection threshold before the system idle timer expires when running on battery power, in seconds.
     * 
     * This member is ignored if the system is performing an automated resume because there is no user present. To temporarily keep the system running while an application is performing a task, use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadexecutionstate">SetThreadExecutionState</a> function.
     */
    IdleTimeoutDc : UInt32

    /**
     * The level of system activity that defines the threshold for idle detection when the system is running on AC (utility) power, expressed as a percentage.
     */
    IdleSensitivityAc : Int8

    /**
     * The level of system activity that defines the threshold for idle detection when the system is running on battery power, expressed as a percentage.
     */
    IdleSensitivityDc : Int8

    /**
     * The processor dynamic throttling policy to use when the system is running on AC (utility) power.
     */
    ThrottlePolicyAc : Int8

    /**
     * The processor dynamic throttling policy to use when the system is running on battery power.
     */
    ThrottlePolicyDc : Int8

    /**
     * The maximum system sleep state when the system is running on AC (utility) power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MaxSleepAc : SYSTEM_POWER_STATE

    /**
     * The maximum system sleep state when the system is running on battery power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MaxSleepDc : SYSTEM_POWER_STATE

    /**
     * Reserved.
     */
    Reserved : UInt32[2]

    /**
     * The time before the display is turned off when the system is running on AC (utility) power, in seconds.
     */
    VideoTimeoutAc : UInt32

    /**
     * The time before the display is turned off when the system is running on battery power, in seconds.
     */
    VideoTimeoutDc : UInt32

    /**
     * The time before power to fixed disk drives is turned off when the system is running on AC (utility) power, in seconds.
     */
    SpindownTimeoutAc : UInt32

    /**
     * The time before power to fixed disk drives is turned off when the system is running on battery power, in seconds.
     */
    SpindownTimeoutDc : UInt32

    /**
     * If this member is <b>TRUE</b>, the system will turn on cooling fans and run the processor at full speed when passive cooling is specified and the system is running on AC (utility) power. This causes the operating system to be biased toward using the fan and running the processor at full speed.
     */
    OptimizeForPowerAc : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the system will turn on cooling fans and run the processor at full speed when passive cooling is specified and the system is running on battery power. This causes the operating system to be biased toward using the fan and running the processor at full speed.
     */
    OptimizeForPowerDc : BOOLEAN

    /**
     * The lower limit that the processor may be throttled down to prior to turning on system fans in response to a thermal event while the system is operating on AC (utility) power, expressed as a percentage.
     */
    FanThrottleToleranceAc : Int8

    /**
     * The lower limit that the processor may be throttled down to prior to turning on system fans in response to a thermal event while the system is operating on battery power, expressed as a percentage.
     */
    FanThrottleToleranceDc : Int8

    /**
     * The processor throttle level to be imposed by the system while the computer is running on AC (utility) power, expressed as a percentage.
     */
    ForcedThrottleAc : Int8

    /**
     * The processor throttle level to be imposed by the system while the computer is running on battery power, expressed as a percentage.
     */
    ForcedThrottleDc : Int8

}
