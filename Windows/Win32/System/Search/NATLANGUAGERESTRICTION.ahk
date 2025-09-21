#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\..\Storage\IndexServer\FULLPROPSPEC.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class NATLANGUAGERESTRICTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {FULLPROPSPEC}
     */
    prop{
        get {
            if(!this.HasProp("__prop"))
                this.__prop := FULLPROPSPEC(this.ptr + 0)
            return this.__prop
        }
    }

    /**
     * @type {Pointer<Char>}
     */
    pwcsPhrase {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
