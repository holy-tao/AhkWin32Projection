#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_QUERYSTATISTICS_COUNTER.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_VIDEO_MEMORY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AllocsCommitted {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    AllocsResidentInP{
        get {
            if(!this.HasProp("__AllocsResidentInPProxyArray"))
                this.__AllocsResidentInPProxyArray := Win32FixedArray(this.ptr + 8, 5, Primitive, "ptr")
            return this.__AllocsResidentInPProxyArray
        }
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    AllocsResidentInNonPreferred {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    TotalBytesEvictedDueToPreparation {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
