#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_HDR_METADATA_HDR10PLUS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 72, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
