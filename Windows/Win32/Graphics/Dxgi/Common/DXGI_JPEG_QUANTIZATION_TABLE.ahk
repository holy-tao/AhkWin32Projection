#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_JPEG_QUANTIZATION_TABLE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Elements{
        get {
            if(!this.HasProp("__ElementsProxyArray"))
                this.__ElementsProxyArray := Win32FixedArray(this.ptr + 0, 64, Primitive, "char")
            return this.__ElementsProxyArray
        }
    }
}
