#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the scaling capabilities of the video scaler.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_scale_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_SCALE_SUPPORT_FLAGS extends Win32BitflagEnum {

    /**
     * All possible output size width/height combinations that exist between the maximum size and minimum size for the extent, inclusive, are supported.
     * Native name: D3D12_VIDEO_SCALE_SUPPORT_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * The scaler only supports output sizes at a power of two scale factors within the range.  The x and y scale factors must be the same for both dimensions when this flag is set.
     * Native name: D3D12_VIDEO_SCALE_SUPPORT_FLAG_POW2_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_POW2_ONLY => 1

    /**
     * The scaler only supports output sizes with even output dimensions.
     * Native name: D3D12_VIDEO_SCALE_SUPPORT_FLAG_EVEN_DIMENSIONS_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_EVEN_DIMENSIONS_ONLY => 2

    /**
     * Native name: D3D12_VIDEO_SCALE_SUPPORT_FLAG_DPB_ENCODER_RESOURCES
     * @type {Integer (Int32)}
     */
    static FLAG_DPB_ENCODER_RESOURCES => 4
}
