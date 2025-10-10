#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_ACTION_POLICY.ahk
#Include .\SYSTEM_POWER_LEVEL.ahk
#Include .\GLOBAL_USER_POWER_POLICY.ahk
#Include .\GLOBAL_MACHINE_POWER_POLICY.ahk

/**
 * Contains global power policy settings that apply to all power schemes.
 * @see https://docs.microsoft.com/windows/win32/api//powrprof/ns-powrprof-global_power_policy
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class GLOBAL_POWER_POLICY extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_user_power_policy">GLOBAL_USER_POWER_POLICY</a> structure that defines the global user power policy settings.
     * @type {GLOBAL_USER_POWER_POLICY}
     */
    user{
        get {
            if(!this.HasProp("__user"))
                this.__user := GLOBAL_USER_POWER_POLICY(this.ptr + 0)
            return this.__user
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/ns-powrprof-global_machine_power_policy">GLOBAL_MACHINE_POWER_POLICY</a> structure that defines the global computer power policy settings.
     * @type {GLOBAL_MACHINE_POWER_POLICY}
     */
    mach{
        get {
            if(!this.HasProp("__mach"))
                this.__mach := GLOBAL_MACHINE_POWER_POLICY(this.ptr + 144)
            return this.__mach
        }
    }
}
