#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains global computer power policy settings that apply to all power schemes for all users.
 * @see https://docs.microsoft.com/windows/win32/api//powrprof/ns-powrprof-global_machine_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class GLOBAL_MACHINE_POWER_POLICY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The current structure revision level. Set this value by calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readglobalpwrpolicy">ReadGlobalPwrPolicy</a> before using a 
     *       <b>GLOBAL_MACHINE_POWER_POLICY</b> structure 
     *       to set power policy.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum power state (highest Sx value) from which a lid-open event should wake the system when running 
     *       on AC power. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. A value 
     *       of <b>PowerSystemUnspecified</b> indicates that a lid-open event does not wake the 
     *       system.
     * @type {Integer}
     */
    LidOpenWakeAc {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The maximum power state (highest Sx value) from which a lid-open event should wake the system when running 
     *       on battery. This member must be one of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values. A value 
     *       of <b>PowerSystemUnspecified</b> indicates that a lid-open event does not wake the 
     *       system.
     * @type {Integer}
     */
    LidOpenWakeDc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The resolution of change in the current battery capacity that should cause the system to be notified of a 
     *       system power state changed event.
     * @type {Integer}
     */
    BroadcastCapacityResolution {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
