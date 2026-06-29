#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_DECODE_TIER.ahk" { D3D12_VIDEO_DECODE_TIER }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS }
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_VIDEO_DECODE_SUPPORT_FLAGS.ahk" { D3D12_VIDEO_DECODE_SUPPORT_FLAGS }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves support information for video decoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_decode_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT {
    #StructPack 4

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeIndex : UInt32

    /**
     * A [D3D12\_VIDEO\_DECODE\_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure specifying the decode profile, bitstream encryption, and interlace type of the source stream.
     */
    Configuration : D3D12_VIDEO_DECODE_CONFIGURATION

    /**
     * The decode width of the source stream.
     */
    Width : UInt32

    /**
     * The decode height of the source stream
     */
    Height : UInt32

    /**
     * The [DXGI\_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) to use as the decode format.  This format is the output format if no decoder conversion is specified.
     */
    DecodeFormat : DXGI_FORMAT

    /**
     * The frame rate of the video format. A value of 0 means the frame rate is unknown.
     */
    FrameRate : DXGI_RATIONAL

    /**
     * The average bits per second data compression rate for the compressed video stream.  This information is used by the driver to determine whether the video can be decoded in real-time. A value of 0 means the bit rate is unknown.
     */
    BitRate : UInt32

    /**
     * A combination of values from the [D3D12\_VIDEO\_DECODE\_SUPPORT\_FLAGS](ne-d3d12video-d3d12_video_decode_support_flags.md) enumeration indicating the support for video decoding. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    SupportFlags : D3D12_VIDEO_DECODE_SUPPORT_FLAGS

    /**
     * A combination of values from the [D3D12\_VIDEO\_DECODE\_CONFIGURATION\_FLAGS](ne-d3d12video-d3d12_video_decode_configuration_flags.md) enumeration describing the video decode configuration. This value is populated by the call to **ID3D12Device::CheckFeatureSupport**.
     */
    ConfigurationFlags : D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS

    /**
     * A member of the [D3D12\_VIDEO\_DECODE\_TIER](ne-d3d12video-d3d12_video_decode_tier.md) enumeration specifying the decoding tier of a hardware video decoder.
     */
    DecodeTier : D3D12_VIDEO_DECODE_TIER

}
