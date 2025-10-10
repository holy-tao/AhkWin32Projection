#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_OUTPUT_METADATA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EncodeErrorFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS}
     */
    EncodeStats{
        get {
            if(!this.HasProp("__EncodeStats"))
                this.__EncodeStats := D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS(this.ptr + 8)
            return this.__EncodeStats
        }
    }

    /**
     * @type {Integer}
     */
    EncodedBitstreamWrittenBytesCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    WrittenSubregionsCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
