#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PNP_REPLACE_PROCESSOR_LIST_V1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    AffinityMask {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AllocatedCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<UInt32>}
     */
    ApicIds{
        get {
            if(!this.HasProp("__ApicIdsProxyArray"))
                this.__ApicIdsProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "uint")
            return this.__ApicIdsProxyArray
        }
    }
}
