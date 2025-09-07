#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset Unicode
 */
class ACTRL_CONTROL_INFOW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    lpControlId{
        get {
            if(!this.HasProp("__lpControlId"))
                this.__lpControlId := PWSTR(this.ptr + 0)
            return this.__lpControlId
        }
    }

    /**
     * @type {PWSTR}
     */
    lpControlName{
        get {
            if(!this.HasProp("__lpControlName"))
                this.__lpControlName := PWSTR(this.ptr + 8)
            return this.__lpControlName
        }
    }
}
