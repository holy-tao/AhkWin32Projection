#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SSERRORINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszMessage{
        get {
            if(!this.HasProp("__pwszMessage"))
                this.__pwszMessage := PWSTR(this.ptr + 0)
            return this.__pwszMessage
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszServer{
        get {
            if(!this.HasProp("__pwszServer"))
                this.__pwszServer := PWSTR(this.ptr + 8)
            return this.__pwszServer
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszProcedure{
        get {
            if(!this.HasProp("__pwszProcedure"))
                this.__pwszProcedure := PWSTR(this.ptr + 16)
            return this.__pwszProcedure
        }
    }

    /**
     * @type {Integer}
     */
    lNative {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    bState {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    bClass {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * @type {Integer}
     */
    wLineNumber {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }
}
