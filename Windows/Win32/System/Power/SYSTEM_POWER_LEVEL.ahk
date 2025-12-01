#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk

/**
 * Contains information about system battery drain policy settings.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_power_level
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_POWER_LEVEL extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * If this member is <b>TRUE</b>, the alarm should be activated when the battery discharges below the value set in <b>BatteryLevel</b>.
     * @type {BOOLEAN}
     */
    Enable {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Spare{
        get {
            if(!this.HasProp("__SpareProxyArray"))
                this.__SpareProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__SpareProxyArray
        }
    }

    /**
     * The battery capacity for this battery discharge policy, expressed as a percentage.
     * @type {Integer}
     */
    BatteryLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take for this battery discharge policy.
     * @type {POWER_ACTION_POLICY}
     */
    PowerPolicy{
        get {
            if(!this.HasProp("__PowerPolicy"))
                this.__PowerPolicy := POWER_ACTION_POLICY(8, this)
            return this.__PowerPolicy
        }
    }

    /**
     * The minimum system sleep state to enter when the battery discharges below the value set in <b>BatteryLevel</b>. This member must be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-system_power_state">SYSTEM_POWER_STATE</a> enumeration type values.
     * @type {Integer}
     */
    MinSystemState {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
