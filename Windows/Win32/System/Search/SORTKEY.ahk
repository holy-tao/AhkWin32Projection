#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Storage\IndexServer\FULLPROPSPEC.ahk
#Include ..\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\Com\StructuredStorage\PROPSPEC_KIND.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class SORTKEY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {FULLPROPSPEC}
     */
    propColumn {
        get {
            if(!this.HasProp("__propColumn"))
                this.__propColumn := FULLPROPSPEC(0, this)
            return this.__propColumn
        }
    }

    /**
     * @type {Integer}
     */
    dwOrder {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    locale {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
