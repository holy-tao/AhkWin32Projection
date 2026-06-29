#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GLOBAL_USER_POWER_POLICY.ahk" { GLOBAL_USER_POWER_POLICY }
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import ".\SYSTEM_POWER_LEVEL.ahk" { SYSTEM_POWER_LEVEL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\GLOBAL_MACHINE_POWER_POLICY.ahk" { GLOBAL_MACHINE_POWER_POLICY }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }

/**
 * Contains global power policy settings that apply to all power schemes.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-global_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct GLOBAL_POWER_POLICY {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_user_power_policy">GLOBAL_USER_POWER_POLICY</a> structure that defines the global user power policy settings.
     */
    user : GLOBAL_USER_POWER_POLICY

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_machine_power_policy">GLOBAL_MACHINE_POWER_POLICY</a> structure that defines the global computer power policy settings.
     */
    mach : GLOBAL_MACHINE_POWER_POLICY

}
