#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TYPEDESC.ahk
#Include .\IDLDESC.ahk
#Include ..\Ole\PARAMDESC.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ELEMDESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {TYPEDESC}
     */
    tdesc{
        get {
            if(!this.HasProp("__tdesc"))
                this.__tdesc := TYPEDESC(this.ptr + 0)
            return this.__tdesc
        }
    }

    /**
     * @type {IDLDESC}
     */
    idldesc{
        get {
            if(!this.HasProp("__idldesc"))
                this.__idldesc := IDLDESC(this.ptr + 16)
            return this.__idldesc
        }
    }

    /**
     * @type {PARAMDESC}
     */
    paramdesc{
        get {
            if(!this.HasProp("__paramdesc"))
                this.__paramdesc := PARAMDESC(this.ptr + 16)
            return this.__paramdesc
        }
    }
}
