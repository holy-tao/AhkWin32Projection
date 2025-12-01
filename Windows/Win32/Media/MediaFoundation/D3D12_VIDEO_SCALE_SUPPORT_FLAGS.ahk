#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the scaling capabilities of the video scaler.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_scale_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_SCALE_SUPPORT_FLAGS extends Win32BitflagEnum{

    /**
     * All possible output size width/height combinations that exist between the maximum size and minimum size for the extent, inclusive, are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_SCALE_SUPPORT_FLAG_NONE => 0

    /**
     * The scaler only supports output sizes at a power of two scale factors within the range.  The x and y scale factors must be the same for both dimensions when this flag is set.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_SCALE_SUPPORT_FLAG_POW2_ONLY => 1

    /**
     * The scaler only supports output sizes with even output dimensions.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_SCALE_SUPPORT_FLAG_EVEN_DIMENSIONS_ONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_SCALE_SUPPORT_FLAG_DPB_ENCODER_RESOURCES => 4
}
