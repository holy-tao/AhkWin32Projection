#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class IMAGEHLP_LINEW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    Key {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LineNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PSTR}
     */
    FileName{
        get {
            if(!this.HasProp("__FileName"))
                this.__FileName := PSTR(this.ptr + 24)
            return this.__FileName
        }
    }

    /**
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
