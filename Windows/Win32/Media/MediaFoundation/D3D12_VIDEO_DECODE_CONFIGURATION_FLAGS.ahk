#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the configuration for video decoding.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_decode_configuration_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS{

    /**
     * No configuration flags.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_NONE => 0

    /**
     * The height of the output decoded surfaces must be a multiple of 32.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_HEIGHT_ALIGNMENT_MULTIPLE_32_REQUIRED => 1

    /**
     * The driver supports post processing. If this flag is set, the host decoder can set up post-processing by using the conversion flags in the <a href="ns-d3d12video-d3d12_video_decode_conversion_arguments.md">D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_POST_PROCESSING_SUPPORTED => 2

    /**
     * Reference resources must be allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY</a>  resource flag.  References textures must be separate from output textures, similar to performing a format conversion or downscale.  This flag must not be set for [D3D12_VIDEO_DECODE_TIER_3](ne-d3d12video-d3d12_video_decode_tier.md) or greater.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_REFERENCE_ONLY_ALLOCATIONS_REQUIRED => 4

    /**
     * The decode resolution can be changed on a non-key frame.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_ALLOW_RESOLUTION_CHANGE_ON_NON_KEY_FRAME => 8
}
