#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UpdateMap {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TemporalUpdate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    UpdateData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumSegments {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA>}
     */
    SegmentsData{
        get {
            if(!this.HasProp("__SegmentsDataProxyArray"))
                this.__SegmentsDataProxyArray := Win32FixedArray(this.ptr + 32, 8, D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA, "")
            return this.__SegmentsDataProxyArray
        }
    }
}
