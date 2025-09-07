#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset ANSI
 */
class ACTRL_CONTROL_INFOA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    lpControlId{
        get {
            if(!this.HasProp("__lpControlId"))
                this.__lpControlId := PSTR(this.ptr + 0)
            return this.__lpControlId
        }
    }

    /**
     * @type {PSTR}
     */
    lpControlName{
        get {
            if(!this.HasProp("__lpControlName"))
                this.__lpControlName := PSTR(this.ptr + 8)
            return this.__lpControlName
        }
    }
}
