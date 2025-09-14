#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_VERSION_INFO extends Win32Struct
{
    static sizeof => 260

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwExtensionVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    lpszExtensionDesc{
        get {
            if(!this.HasProp("__lpszExtensionDescProxyArray"))
                this.__lpszExtensionDescProxyArray := Win32FixedArray(this.ptr + 4, 256, Primitive, "char")
            return this.__lpszExtensionDescProxyArray
        }
    }
}
