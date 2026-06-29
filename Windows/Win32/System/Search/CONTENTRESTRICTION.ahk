#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\Com\StructuredStorage\PROPSPEC_KIND.ahk
#Include ..\..\Storage\IndexServer\FULLPROPSPEC.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class CONTENTRESTRICTION extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {FULLPROPSPEC}
     */
    prop {
        get {
            if(!this.HasProp("__prop"))
                this.__prop := FULLPROPSPEC(0, this)
            return this.__prop
        }
    }

    /**
     * @type {PWSTR}
     */
    pwcsPhrase {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulGenerateMethod {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
