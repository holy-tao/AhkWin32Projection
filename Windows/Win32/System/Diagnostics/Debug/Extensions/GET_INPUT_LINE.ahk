#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class GET_INPUT_LINE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Prompt{
        get {
            if(!this.HasProp("__Prompt"))
                this.__Prompt := PSTR(this.ptr + 0)
            return this.__Prompt
        }
    }

    /**
     * @type {PSTR}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := PSTR(this.ptr + 8)
            return this.__Buffer
        }
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    InputSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
