#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_PREEMPTION_INFORMATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    PreemptionCounter{
        get {
            if(!this.HasProp("__PreemptionCounterProxyArray"))
                this.__PreemptionCounterProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "uint")
            return this.__PreemptionCounterProxyArray
        }
    }
}
