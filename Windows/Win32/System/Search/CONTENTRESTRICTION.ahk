#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\..\Storage\IndexServer\FULLPROPSPEC.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class CONTENTRESTRICTION extends Win32Struct
{
    static sizeof => 40

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
     * @type {PWSTR}
     */
    pwcsPhrase{
        get {
            if(!this.HasProp("__pwcsPhrase"))
                this.__pwcsPhrase := PWSTR(this.ptr + 24)
            return this.__pwcsPhrase
        }
    }

    /**
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ulGenerateMethod {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
