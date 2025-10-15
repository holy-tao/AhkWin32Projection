#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\BINARY_CONTAINER.ahk
#Include .\BIDI_DATA.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BIDI_REQUEST_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwReqNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pSchema{
        get {
            if(!this.HasProp("__pSchema"))
                this.__pSchema := PWSTR(this.ptr + 8)
            return this.__pSchema
        }
    }

    /**
     * @type {BIDI_DATA}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := BIDI_DATA(this.ptr + 16)
            return this.__data
        }
    }
}
