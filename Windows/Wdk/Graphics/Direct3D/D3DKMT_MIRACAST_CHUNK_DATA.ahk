#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MIRACAST_CHUNK_DATA extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    ChunkInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PrivateDriverDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Integer>}
     */
    PrivateDriverData {
        get {
            if(!this.HasProp("__PrivateDriverDataProxyArray"))
                this.__PrivateDriverDataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__PrivateDriverDataProxyArray
        }
    }
}
