#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PPM_IDLE_STATE_BUCKET_EX.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PPM_IDLE_STATE_ACCOUNTING_EX extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TotalTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IdleTransitions {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FailedTransitions {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    InvalidBucketIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MinTimeUs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    MaxTimeUs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CancelledTransitions {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<PPM_IDLE_STATE_BUCKET_EX>}
     */
    IdleTimeBuckets{
        get {
            if(!this.HasProp("__IdleTimeBucketsProxyArray"))
                this.__IdleTimeBucketsProxyArray := Win32FixedArray(this.ptr + 32, 8, PPM_IDLE_STATE_BUCKET_EX, "")
            return this.__IdleTimeBucketsProxyArray
        }
    }
}
