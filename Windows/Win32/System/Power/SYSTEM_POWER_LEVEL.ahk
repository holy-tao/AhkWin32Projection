#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_ACTION_POLICY_EVENT_CODE.ahk" { POWER_ACTION_POLICY_EVENT_CODE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\POWER_ACTION.ahk" { POWER_ACTION }
#Import ".\POWER_ACTION_POLICY.ahk" { POWER_ACTION_POLICY }

/**
 * Contains information about system battery drain policy settings.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_power_level
 * @namespace Windows.Win32.System.Power
 */
export default struct SYSTEM_POWER_LEVEL {
    #StructPack 4

    /**
     * If this member is <b>TRUE</b>, the alarm should be activated when the battery discharges below the value set in <b>BatteryLevel</b>.
     */
    Enable : BOOLEAN

    /**
     * Reserved.
     */
    Spare : Int8[3]

    /**
     * The battery capacity for this battery discharge policy, expressed as a percentage.
     */
    BatteryLevel : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take for this battery discharge policy.
     */
    PowerPolicy : POWER_ACTION_POLICY

    /**
     * The minimum system sleep state to enter when the battery discharges below the value set in <b>BatteryLevel</b>. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     */
    MinSystemState : SYSTEM_POWER_STATE

}
