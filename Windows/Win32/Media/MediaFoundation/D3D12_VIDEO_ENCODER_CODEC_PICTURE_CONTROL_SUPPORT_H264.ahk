#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents picture control support settings for H.264 video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_picture_control_support_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The maximum value allowed in the slice headers for (num_ref_idx_l0_active_minus1 +1) when encoding P frames. This is equivalent to the maximum size of an L0 for a P frame supported.
     * @type {Integer}
     */
    MaxL0ReferencesForP {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum value allowed in the slice headers for (num_ref_idx_l0_active_minus1 +1) when encoding B frames. This is equivalent to the maximum size of an L0 for a B frame supported.
     * @type {Integer}
     */
    MaxL0ReferencesForB {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The maximum value allowed in the slice headers for (num_ref_idx_l1_active_minus1 +1) when encoding B frames. This is equivalent to the maximum size of an L1 for a B frame supported.
     * @type {Integer}
     */
    MaxL1ReferencesForB {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum number of references used in a frame that can be marked as long term reference.
     * @type {Integer}
     */
    MaxLongTermReferences {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum number of unique pictures that can be used from the DPB the caller manages (number of unique indices in L0 union L1) for a given [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) command on the underlying hardware.
     * @type {Integer}
     */
    MaxDPBCapacity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
