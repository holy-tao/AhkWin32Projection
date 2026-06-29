#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_SCALE_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_SCALE_SUPPORT_FLAGS }
#Import ".\D3D12_VIDEO_SIZE_RANGE.ahk" { D3D12_VIDEO_SIZE_RANGE }

/**
 * Describes the supported scaling range of output sizes for a video scaler.
 * @remarks
 * By default, all possible output size combinations that exist between the maximum size and minimum size for the extent, inclusive, are supported.  *ScaleSupportFlags* may add additional restrictions to the supported scale sizes.  
 * When scaling is not supported, the minimum and maximum sizes should both be set to the input size and no flags should be specified.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_scale_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_SCALE_SUPPORT {
    #StructPack 4

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure describing the supported output size range for the scaler.
     */
    OutputSizeRange : D3D12_VIDEO_SIZE_RANGE

    /**
     * A member of the [D3D12_VIDEO_SCALE_SUPPORT_FLAGS](ne-d3d12video-d3d12_video_scale_support_flags.md) enumeration specifying the supported scaling capabilities of the scaler.
     */
    Flags : D3D12_VIDEO_SCALE_SUPPORT_FLAGS

}
