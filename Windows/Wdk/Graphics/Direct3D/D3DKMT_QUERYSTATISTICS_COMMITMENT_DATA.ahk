#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_COMMITMENT_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TotalBytesEvictedFromProcess {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt64>}
     */
    BytesBySegmentPreference{
        get {
            if(!this.HasProp("__BytesBySegmentPreferenceProxyArray"))
                this.__BytesBySegmentPreferenceProxyArray := Win32FixedArray(this.ptr + 8, 5, Primitive, "uint")
            return this.__BytesBySegmentPreferenceProxyArray
        }
    }
}
