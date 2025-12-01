#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the decoding tier of a hardware video decoder, which determines the required format of application-defined textures and buffers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_decode_tier
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_TIER extends Win32Enum{

    /**
     * Video decoding is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_TIER_NOT_SUPPORTED => 0

    /**
     * In tier 1, the hardware decoder requires that the application allocate reference textures as a texture array. This is to accommodate hardware requirements that the textures be "close" in address space because the hardware doesn't support a full size pointer for each individual picture buffer.  Instead it has one pointer and a more limited bit offset. For more information on texture arrays, see [Introduction To Textures in Direct3D 11](/windows/win32/direct3d11/overviews-direct3d-11-resources-textures-intro).
     * 
     * If the decoder hardware requires a unique memory layout that is not supported for operations on other engines or different video operations, the decoder may set the <a href="ne-d3d12video-d3d12_video_decode_configuration_flags.md">D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_REFERENCE_ONLY_ALLOCATIONS_REQUIRED</a> configuration flag in the <a href="ns-d3d12video-d3d12_feature_data_video_decode_support.md">D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT</a> structure when queried for profile support. This flag indicates that the application must allocate references with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY</a> flag.  The application should use the <a href="ns-d3d12video-d3d12_video_decode_conversion_arguments.md">D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS</a> structure to set a reference-only output if the output is needed as a future reference frame.  The output frame passed to <a href="nf-d3d12video-id3d12videodecodecommandlist-decodeframe.md">ID3D12VideoCommandList::DecodeFrame</a> is a D3D12 resource that can be consumed by other portions of the pipeline and must not have the D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY flag.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_TIER_1 => 1

    /**
     * In decode tier 2, textures can be referenced as a texture array or as an array of separate texture 2D resources (each resource having array size of 1). This is more flexible for the caller and is important in scenarios where the resolution changes frequently such as in streaming video, because a texture array can only be allocated and deallocated as a single unit, but separate texture 2D resources can be allocated and deallocated individually.  
     * 
     * If decode hardware requires a unique tiling format that is not supported for operations on other engines or different video operations, the decoder may set the <a href="ne-d3d12video-d3d12_video_decode_configuration_flags.md">D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_REFERENCE_ONLY_ALLOCATIONS_REQUIRED</a> configuration flag in the <a href="ns-d3d12video-d3d12_feature_data_video_decode_support.md">D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT</a> structure when queried for profile support. This flag indicates that the application must allocate references with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY</a> flag.  The application should use the <a href="ns-d3d12video-d3d12_video_decode_conversion_arguments.md">D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS</a> structure to set a reference only output if the output is needed as a future reference frame.  The output frame passed to <a href="nf-d3d12video-id3d12videodecodecommandlist-decodeframe.md">ID3D12VideoCommandList::DecodeFrame</a> is a D3D12 resource that can be consumed by other portions of the pipeline and must not have the D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY flag.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_TIER_2 => 2

    /**
     * This field is reserved.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_TIER_3 => 3
}
