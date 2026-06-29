#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import ".\SYSTEM_POWER_LEVEL.ahk" { SYSTEM_POWER_LEVEL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }

/**
 * Contains global user power policy settings that apply to all power schemes for a user.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-global_user_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct GLOBAL_USER_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readglobalpwrpolicy">ReadGlobalPwrPolicy</a> before using a <b>GLOBAL_USER_POWER_POLICY</b> structure to set power policy.
     */
    Revision : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the power button is pressed and the system is running on AC power.
     */
    PowerButtonAc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the power button is pressed and the system is running on battery power.
     */
    PowerButtonDc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the sleep button is pressed and the system is running on AC power.
     */
    SleepButtonAc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the sleep button is pressed and the system is running on battery power.
     */
    SleepButtonDc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the lid is closed and the system is running on AC power.
     */
    LidCloseAc : POWER_ACTION_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the lid is closed and the system is running on battery power.
     */
    LidCloseDc : POWER_ACTION_POLICY

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_level">SYSTEM_POWER_LEVEL</a> structures that defines the actions to take at system battery discharge events.
     */
    DischargePolicy : SYSTEM_POWER_LEVEL[4]

    /**
     * A flag that enables or disables miscellaneous user power policy settings. This member can be one or more of the values described in 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/global-flags-constants">Global Flags Constants</a>.
     */
    GlobalFlags : UInt32

}
