#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }

/**
 * Contains computer power policy settings that are unique to each power scheme on the computer.
 * @remarks
 * <b>DozeS4TimeoutAc</b> and <b>DozeS4TimeoutDc</b>  correspond to the <b>DozeS4Timeout</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_policy">SYSTEM_POWER_POLICY</a>. These values are merged from the machine power policy to the system power policy when the <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-setactivepwrscheme">SetActivePwrScheme</a> function is called to apply a power scheme.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-machine_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct MACHINE_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readpwrscheme">ReadPwrScheme</a> before using a <b>MACHINE_POWER_POLICY</b> structure to set power policy.
     */
    Revision : UInt32

    /**
     * The minimum system power state (lowest Sx value) to enter on a system sleep action when running on AC power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MinSleepAc : SYSTEM_POWER_STATE

    /**
     * The minimum system power state (lowest Sx value) to enter on a system sleep action when running on battery power. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MinSleepDc : SYSTEM_POWER_STATE

    /**
     * The maximum system power state (highest Sx value) to enter on a system sleep action when running on AC power, and when there are outstanding latency requirements. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. If an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with LT_LOWEST_LATENCY, <b>ReducedLatencySleepAc</b> is used in place of <b>MaxSleepAc</b>.
     */
    ReducedLatencySleepAc : SYSTEM_POWER_STATE

    /**
     * The maximum system power state (highest Sx value) to enter on a system sleep action when running on battery power, and when there are outstanding latency requirements. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. If an application calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-requestwakeuplatency">RequestWakeupLatency</a> with LT_LOWEST_LATENCY, <b>ReducedLatencySleepAc</b> is used in place of <b>MaxSleepAc</b>.
     */
    ReducedLatencySleepDc : SYSTEM_POWER_STATE

    /**
     * This member is ignored.
     */
    DozeTimeoutAc : UInt32

    /**
     * This member is ignored.
     */
    DozeTimeoutDc : UInt32

    /**
     * Time to wait between entering the suspend state and entering the hibernate sleeping state when the system is running on AC power, in seconds. A value of zero indicates never hibernate.
     */
    DozeS4TimeoutAc : UInt32

    /**
     * Time to wait between entering the suspend state and entering the hibernate sleeping state when the system is running on battery power, in seconds. A value of zero indicates never hibernate.
     */
    DozeS4TimeoutDc : UInt32

    /**
     * The minimum throttle setting allowed before being overthrottled when the system is running on AC power. Thermal conditions would be the only reason for going below the minimum setting. When the processor is overthrottled, the system will initiate the <b>OverThrottledAc</b> policy. Note that the power policy manager has a hard-coded policy to initiate a CriticalShutdownOff whenever any thermal zone indicates a critical thermal condition. Range: 0-100.
     */
    MinThrottleAc : Int8

    /**
     * The minimum throttle setting allowed before being overthrottled when the system is running on battery power. Thermal conditions would be the only reason for going below the minimum setting. When the processor is overthrottled, the system will initiate the <b>OverThrottledDc</b> policy. Note that the power policy manager has a hard-coded policy to initiate a CriticalShutdownOff whenever any thermal zone indicates a critical thermal condition. Range: 0-100.
     */
    MinThrottleDc : Int8

    /**
     * Reserved.
     */
    pad1 : Int8[2]

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when a processor has become overthrottled (as defined by the <b>MinThrottleAc</b> member) when the system is running on AC power.
     */
    OverThrottledAc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when a processor has become overthrottled (as defined by the <b>MinThrottleDc</b> member) when the system is running on battery power.
     */
    OverThrottledDc : POWER_ACTION_POLICY

}
