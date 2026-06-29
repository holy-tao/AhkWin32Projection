#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }

/**
 * Contains global computer power policy settings that apply to all power schemes for all users.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-global_machine_power_policy
 * @namespace Windows.Win32.System.Power
 */
export default struct GLOBAL_MACHINE_POWER_POLICY {
    #StructPack 4

    /**
     * The current structure revision level. Set this value by calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readglobalpwrpolicy">ReadGlobalPwrPolicy</a> before using a 
     *       <b>GLOBAL_MACHINE_POWER_POLICY</b> structure 
     *       to set power policy.
     */
    Revision : UInt32

    /**
     * The maximum power state (highest Sx value) from which a lid-open event should wake the system when running 
     *       on AC power. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. A value 
     *       of <b>PowerSystemUnspecified</b> indicates that a lid-open event does not wake the 
     *       system.
     */
    LidOpenWakeAc : SYSTEM_POWER_STATE

    /**
     * The maximum power state (highest Sx value) from which a lid-open event should wake the system when running 
     *       on battery. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. A value 
     *       of <b>PowerSystemUnspecified</b> indicates that a lid-open event does not wake the 
     *       system.
     */
    LidOpenWakeDc : SYSTEM_POWER_STATE

    /**
     * The resolution of change in the current battery capacity that should cause the system to be notified of a 
     *       system power state changed event.
     */
    BroadcastCapacityResolution : UInt32

}
