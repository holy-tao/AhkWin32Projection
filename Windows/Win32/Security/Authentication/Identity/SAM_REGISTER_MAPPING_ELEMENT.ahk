#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SAM_REGISTER_MAPPING_ELEMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Original{
        get {
            if(!this.HasProp("__Original"))
                this.__Original := PSTR(this.ptr + 0)
            return this.__Original
        }
    }

    /**
     * @type {PSTR}
     */
    Mapped{
        get {
            if(!this.HasProp("__Mapped"))
                this.__Mapped := PSTR(this.ptr + 8)
            return this.__Mapped
        }
    }

    /**
     * @type {Integer}
     */
    Continuable {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
