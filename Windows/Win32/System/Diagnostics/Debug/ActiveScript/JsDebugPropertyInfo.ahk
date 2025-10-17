#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class JsDebugPropertyInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {BSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := BSTR(0, this)
            return this.__name
        }
    }

    /**
     * @type {BSTR}
     */
    type{
        get {
            if(!this.HasProp("__type"))
                this.__type := BSTR(8, this)
            return this.__type
        }
    }

    /**
     * @type {BSTR}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := BSTR(16, this)
            return this.__value
        }
    }

    /**
     * @type {BSTR}
     */
    fullName{
        get {
            if(!this.HasProp("__fullName"))
                this.__fullName := BSTR(24, this)
            return this.__fullName
        }
    }

    /**
     * @type {Integer}
     */
    attr {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
