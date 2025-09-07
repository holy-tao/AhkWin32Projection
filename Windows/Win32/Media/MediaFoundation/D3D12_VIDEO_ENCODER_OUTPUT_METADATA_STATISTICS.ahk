#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents encoding statistics about a ID3D12VideoEncodeCommandList2::EncodeFrame operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_output_metadata_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Output field that receives the average QP value used for encoding this frame.
     * @type {Integer}
     */
    AverageQP {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Output field that receives the number of intra-coded coding units used in this frame.
     * @type {Integer}
     */
    IntraCodingUnitsCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Output field that receives the number of inter-coded coding units used in this frame.
     * @type {Integer}
     */
    InterCodingUnitsCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Output field that receives the number of skip coding units used in this frame.
     * @type {Integer}
     */
    SkipCodingUnitsCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Output field that receives the average motion vector shift in X direction.
     * @type {Integer}
     */
    AverageMotionEstimationXDirection {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Output field that receives the average motion vector shift in Y direction.
     * @type {Integer}
     */
    AverageMotionEstimationYDirection {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
