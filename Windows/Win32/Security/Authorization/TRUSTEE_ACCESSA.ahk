#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset ANSI
 */
class TRUSTEE_ACCESSA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    lpProperty{
        get {
            if(!this.HasProp("__lpProperty"))
                this.__lpProperty := PSTR(this.ptr + 0)
            return this.__lpProperty
        }
    }

    /**
     * @type {Integer}
     */
    Access {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    fAccessFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    fReturnedAccess {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
