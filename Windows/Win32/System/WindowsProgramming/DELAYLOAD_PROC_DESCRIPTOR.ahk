#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DELAYLOAD_PROC_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ImportDescribedByName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PSTR(this.ptr + 8)
            return this.__Name
        }
    }

    /**
     * @type {Integer}
     */
    Ordinal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
