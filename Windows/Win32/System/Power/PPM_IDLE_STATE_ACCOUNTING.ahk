#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PPM_IDLE_STATE_ACCOUNTING extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    IdleTransitions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FailedTransitions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    InvalidBucketIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TotalTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    IdleTimeBuckets{
        get {
            if(!this.HasProp("__IdleTimeBucketsProxyArray"))
                this.__IdleTimeBucketsProxyArray := Win32FixedArray(this.ptr + 24, 6, Primitive, "uint")
            return this.__IdleTimeBucketsProxyArray
        }
    }
}
