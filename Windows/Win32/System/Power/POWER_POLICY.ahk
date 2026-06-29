#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }
#Import ".\USER_POWER_POLICY.ahk" { USER_POWER_POLICY }
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\MACHINE_POWER_POLICY.ahk" { MACHINE_POWER_POLICY }

/**
 * Contains power policy settings that are unique to each power scheme.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_POLICY {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-user_power_policy">USER_POWER_POLICY</a> structure that defines user power policy settings.
     */
    user : USER_POWER_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-machine_power_policy">MACHINE_POWER_POLICY</a> structure that defines computer power policy settings.
     */
    mach : MACHINE_POWER_POLICY

}
