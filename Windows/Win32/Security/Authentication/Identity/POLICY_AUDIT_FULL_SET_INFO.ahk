#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_AUDIT_FULL_SET_INFO extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    ShutDownOnFull{
        get {
            if(!this.HasProp("__ShutDownOnFull"))
                this.__ShutDownOnFull := BOOLEAN(this.ptr + 0)
            return this.__ShutDownOnFull
        }
    }
}
