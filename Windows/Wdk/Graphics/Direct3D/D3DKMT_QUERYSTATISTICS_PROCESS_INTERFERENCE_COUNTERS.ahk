#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_PROCESS_INTERFERENCE_COUNTERS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    InterferenceCount{
        get {
            if(!this.HasProp("__InterferenceCountProxyArray"))
                this.__InterferenceCountProxyArray := Win32FixedArray(this.ptr + 0, 9, Primitive, "uint")
            return this.__InterferenceCountProxyArray
        }
    }
}
