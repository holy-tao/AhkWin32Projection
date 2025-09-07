#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class DxcShaderHash extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    HashDigest{
        get {
            if(!this.HasProp("__HashDigestProxyArray"))
                this.__HashDigestProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__HashDigestProxyArray
        }
    }
}
