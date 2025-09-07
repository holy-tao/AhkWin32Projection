#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a rate control structure definition for constant quantization parameter mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_cqp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A UINT64 specifying the quantization parameter that should be used for each fully intra-encoded frame.
     * @type {Integer}
     */
    ConstantQP_FullIntracodedFrame {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A UINT64 specifying the quantization parameter that should be used for each encoded frame that has inter-picture references to pictures (in display order) before the current one.
     * @type {Integer}
     */
    ConstantQP_InterPredictedFrame_PrevRefOnly {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A UINT64 specifying the quantization parameter that should be used for each encoded frame that has inter-picture references to pictures (in display order) both from previous and next frames.
     * @type {Integer}
     */
    ConstantQP_InterPredictedFrame_BiDirectionalRef {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
