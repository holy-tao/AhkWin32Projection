#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\..\Storage\IndexServer\FULLPROPSPEC.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SORTKEY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {FULLPROPSPEC}
     */
    propColumn{
        get {
            if(!this.HasProp("__propColumn"))
                this.__propColumn := FULLPROPSPEC(this.ptr + 0)
            return this.__propColumn
        }
    }

    /**
     * @type {Integer}
     */
    dwOrder {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    locale {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
