#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies video encoder picture control flags.
 * @remarks
 * Values from this enumeration are used by [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md).
 * 
 * If this flag is not set, the [D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE.pReconstructedPicture](ns-d3d12video-d3d12_video_encoder_reconstructed_picture.md) can be nullptr in the associated call to [ID3D12VideoEncodeCommandList2::EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_picture_control_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAGS extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_NONE => 0

    /**
     * The associated frame will be used as a reference frame in future encode commands. Indicates that the reconstructed picture along with the bitstream should be output for the host to place it in future calls in the reconstructed pictures reference list. 
     * 
     * Note that there might be limitations for some frame types to be marked as references. Check feature support before setting this value.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_USED_AS_REFERENCE_PICTURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_ENABLE_QUANTIZATION_MATRIX_INPUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_ENABLE_DIRTY_REGIONS_INPUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_ENABLE_MOTION_VECTORS_INPUT => 8
}
