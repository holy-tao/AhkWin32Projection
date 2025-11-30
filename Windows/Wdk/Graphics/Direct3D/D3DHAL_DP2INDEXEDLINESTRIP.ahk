#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DHAL_DP2INDEXEDLINESTRIP extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Array<UInt16>}
     */
    wV{
        get {
            if(!this.HasProp("__wVProxyArray"))
                this.__wVProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__wVProxyArray
        }
    }
}
