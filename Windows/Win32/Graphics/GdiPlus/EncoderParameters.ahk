#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\EncoderParameter.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class EncoderParameters extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {EncoderParameter}
     */
    Parameter {
        get {
            if(!this.HasProp("__ParameterProxyArray"))
                this.__ParameterProxyArray := Win32FixedArray(this.ptr + 8, 1, EncoderParameter, "")
            return this.__ParameterProxyArray
        }
    }
}
