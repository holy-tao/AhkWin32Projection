#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/d3d-omac
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3D_OMAC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Omac{
        get {
            if(!this.HasProp("__OmacProxyArray"))
                this.__OmacProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__OmacProxyArray
        }
    }
}
