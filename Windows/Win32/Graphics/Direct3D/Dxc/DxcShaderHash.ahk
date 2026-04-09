#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
class DxcShaderHash extends Win32Struct {
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
     * @type {Array<Integer>}
     */
    HashDigest {
        get {
            if(!this.HasProp("__HashDigestProxyArray"))
                this.__HashDigestProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__HashDigestProxyArray
        }
    }
}
