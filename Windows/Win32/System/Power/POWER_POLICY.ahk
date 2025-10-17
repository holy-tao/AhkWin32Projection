#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk
#Include .\USER_POWER_POLICY.ahk
#Include .\MACHINE_POWER_POLICY.ahk

/**
 * Contains power policy settings that are unique to each power scheme.
 * @see https://docs.microsoft.com/windows/win32/api//powrprof/ns-powrprof-power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_POLICY extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-user_power_policy">USER_POWER_POLICY</a> structure that defines user power policy settings.
     * @type {USER_POWER_POLICY}
     */
    user{
        get {
            if(!this.HasProp("__user"))
                this.__user := USER_POWER_POLICY(0, this)
            return this.__user
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-machine_power_policy">MACHINE_POWER_POLICY</a> structure that defines computer power policy settings.
     * @type {MACHINE_POWER_POLICY}
     */
    mach{
        get {
            if(!this.HasProp("__mach"))
                this.__mach := MACHINE_POWER_POLICY(88, this)
            return this.__mach
        }
    }
}
