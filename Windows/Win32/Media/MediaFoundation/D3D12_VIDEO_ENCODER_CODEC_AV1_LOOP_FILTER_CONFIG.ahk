#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    LoopFilterLevel{
        get {
            if(!this.HasProp("__LoopFilterLevelProxyArray"))
                this.__LoopFilterLevelProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
            return this.__LoopFilterLevelProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LoopFilterLevelU {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LoopFilterLevelV {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    LoopFilterSharpnessLevel {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    LoopFilterDeltaEnabled {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    UpdateRefDelta {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<Int64>}
     */
    RefDeltas{
        get {
            if(!this.HasProp("__RefDeltasProxyArray"))
                this.__RefDeltasProxyArray := Win32FixedArray(this.ptr + 56, 8, Primitive, "int64")
            return this.__RefDeltasProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UpdateModeDelta {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Array<Int64>}
     */
    ModeDeltas{
        get {
            if(!this.HasProp("__ModeDeltasProxyArray"))
                this.__ModeDeltasProxyArray := Win32FixedArray(this.ptr + 128, 2, Primitive, "int64")
            return this.__ModeDeltasProxyArray
        }
    }
}
