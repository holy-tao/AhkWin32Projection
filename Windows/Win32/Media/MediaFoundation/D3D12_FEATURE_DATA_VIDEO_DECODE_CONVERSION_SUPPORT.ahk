#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_SCALE_SUPPORT.ahk" { D3D12_VIDEO_SCALE_SUPPORT }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import ".\D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS }
#Import ".\D3D12_VIDEO_SIZE_RANGE.ahk" { D3D12_VIDEO_SIZE_RANGE }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import ".\D3D12_VIDEO_SCALE_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_SCALE_SUPPORT_FLAGS }
#Import ".\D3D12_VIDEO_SAMPLE.ahk" { D3D12_VIDEO_SAMPLE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\D3D12_VIDEO_FORMAT.ahk" { D3D12_VIDEO_FORMAT }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves the list of supported profiles. (D3D12_FEATURE_DATA_VIDEO_DECODE_CONVERSION_SUPPORT)
 * @remarks
 * If the colorspace and format conversion is supported, *ScaleFlags* will have the [D3D12\_VIDEO\_SCALE\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_scale_support_flags.md) set. Callers should check the [D3D12\_VIDEO\_SIZE\_RANGE](ns-d3d12video-d3d12_video_size_range.md) field to determine if the requested scale is supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_decode_conversion_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODE_CONVERSION_SUPPORT {
    #StructPack 4

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeIndex : UInt32

    /**
     * A [D3D12\_VIDEO\_DECODE\_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure describing the decode configuration.
     */
    Configuration : D3D12_VIDEO_DECODE_CONFIGURATION

    /**
     * A [D3D12\_VIDEO\_SAMPLE](ns-d3d12video-d3d12_video_sample.md) structure representing the source decoded as sample description.
     */
    DecodeSample : D3D12_VIDEO_SAMPLE

    /**
     * A [D3D12\_VIDEO\_FORMAT](ns-d3d12video-d3d12_video_format.md) structure containing the output sample description.
     */
    OutputFormat : D3D12_VIDEO_FORMAT

    /**
     * The frame rate of the video content. This is used by the driver to determine whether the video can be decoded in real-time.
     */
    FrameRate : DXGI_RATIONAL

    /**
     * The average bits per second data compression rate for the compressed video stream.  This is used by the driver to determine whether the video can be decoded in real-time.
     */
    BitRate : UInt32

    /**
     * A combination of values from the [D3D12\_VIDEO\_DECODE\_CONVERSION\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_decode_conversion_support_flags.md) indicating the support for the specified conversion.
     */
    SupportFlags : D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS

    /**
     * A [D3D12\_VIDEO\_SCALE\_SUPPORT](ns-d3d12video-d3d12_video_scale_support.md) structure representing the output size range for decode conversion.
     */
    ScaleSupport : D3D12_VIDEO_SCALE_SUPPORT

}
