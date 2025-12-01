#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a reference picture descriptor for HEVC video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_reference_picture_descriptor_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * A **UINT** that maps the current reference picture described by this structure to a resource in the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md) array.
     * @type {Integer}
     */
    ReconstructedPictureResourceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A **BOOL** indicating whether this descriptor entry is being used by the current picture by being indexed from either L0 and/or L1 lists.
     * @type {BOOL}
     */
    IsRefUsedByCurrentPic {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A **BOOL** that is set to true when the described reference frame is being used as a long-term reference picture.
     * @type {BOOL}
     */
    IsLongTermReference {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A **UINT** specifying the described reference frame display order.
     * @type {Integer}
     */
    PictureOrderCountNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A **UINT** specifying the picture layer number in temporal hierarchy. Check for maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc.md).
     * @type {Integer}
     */
    TemporalLayerIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
