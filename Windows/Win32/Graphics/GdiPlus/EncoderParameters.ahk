#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EncoderParameter.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EncoderParameters extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<EncoderParameter>}
     */
    Parameter{
        get {
            if(!this.HasProp("__ParameterProxyArray"))
                this.__ParameterProxyArray := Win32FixedArray(this.ptr + 8, 1, EncoderParameter, "")
            return this.__ParameterProxyArray
        }
    }
}
