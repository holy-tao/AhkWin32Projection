#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk
#Include .\SYSTEM_POWER_LEVEL.ahk

/**
 * Contains global user power policy settings that apply to all power schemes for a user.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ns-powrprof-global_user_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class GLOBAL_USER_POWER_POLICY extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * The current structure revision level. Set this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-getcurrentpowerpolicies">GetCurrentPowerPolicies</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-readglobalpwrpolicy">ReadGlobalPwrPolicy</a> before using a <b>GLOBAL_USER_POWER_POLICY</b> structure to set power policy.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the power button is pressed and the system is running on AC power.
     * @type {POWER_ACTION_POLICY}
     */
    PowerButtonAc{
        get {
            if(!this.HasProp("__PowerButtonAc"))
                this.__PowerButtonAc := POWER_ACTION_POLICY(8, this)
            return this.__PowerButtonAc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the power button is pressed and the system is running on battery power.
     * @type {POWER_ACTION_POLICY}
     */
    PowerButtonDc{
        get {
            if(!this.HasProp("__PowerButtonDc"))
                this.__PowerButtonDc := POWER_ACTION_POLICY(24, this)
            return this.__PowerButtonDc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the sleep button is pressed and the system is running on AC power.
     * @type {POWER_ACTION_POLICY}
     */
    SleepButtonAc{
        get {
            if(!this.HasProp("__SleepButtonAc"))
                this.__SleepButtonAc := POWER_ACTION_POLICY(40, this)
            return this.__SleepButtonAc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the sleep button is pressed and the system is running on battery power.
     * @type {POWER_ACTION_POLICY}
     */
    SleepButtonDc{
        get {
            if(!this.HasProp("__SleepButtonDc"))
                this.__SleepButtonDc := POWER_ACTION_POLICY(56, this)
            return this.__SleepButtonDc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the lid is closed and the system is running on AC power.
     * @type {POWER_ACTION_POLICY}
     */
    LidCloseAc{
        get {
            if(!this.HasProp("__LidCloseAc"))
                this.__LidCloseAc := POWER_ACTION_POLICY(72, this)
            return this.__LidCloseAc
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-power_action_policy">POWER_ACTION_POLICY</a> structure that defines the action to take when the lid is closed and the system is running on battery power.
     * @type {POWER_ACTION_POLICY}
     */
    LidCloseDc{
        get {
            if(!this.HasProp("__LidCloseDc"))
                this.__LidCloseDc := POWER_ACTION_POLICY(88, this)
            return this.__LidCloseDc
        }
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_power_level">SYSTEM_POWER_LEVEL</a> structures that defines the actions to take at system battery discharge events.
     * @type {Array<SYSTEM_POWER_LEVEL>}
     */
    DischargePolicy{
        get {
            if(!this.HasProp("__DischargePolicyProxyArray"))
                this.__DischargePolicyProxyArray := Win32FixedArray(this.ptr + 104, 4, SYSTEM_POWER_LEVEL, "")
            return this.__DischargePolicyProxyArray
        }
    }

    /**
     * A flag that enables or disables miscellaneous user power policy settings. This member can be one or more of the values described in 
     * <a href="https://docs.microsoft.com/windows/desktop/Power/global-flags-constants">Global Flags Constants</a>.
     * @type {Integer}
     */
    GlobalFlags {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
