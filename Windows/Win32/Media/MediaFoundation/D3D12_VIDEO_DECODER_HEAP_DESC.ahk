#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import "..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a ID3D12VideoDecoderHeap.
 * @remarks
 * The *BitRate* and *FrameRate* parameters may be used by drivers to inform heuristics such as intermediate allocation sizes.  Decoding a frame may fail if these values are insufficient for the video stream.  Use [D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS](ns-d3d12video-d3d12_query_data_video_decode_statistics.md) to determine if the video decode succeeded.  If decode fails due to insufficient *BitRate* and *FrameRate* parameters, the *Status* field of this query is set to [D3D12_VIDEO_DECODE_STATUS_RATE_EXCEEDED](ne-d3d12video-d3d12_video_decode_status.md).  This query also returns new *BitRate* and *FrameRate* values that would succeed.
 * 
 * The *BitRate* and *FrameRate* parameters may also be set to zero.  Drivers make worst-case assumptions when these values are used which may result in higher memory consumption with some adapters.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decoder_heap_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODER_HEAP_DESC {
    #StructPack 4

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * A [D3D12_VIDEO_DECODE_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure specifying the configuration of the video decoder.
     */
    Configuration : D3D12_VIDEO_DECODE_CONFIGURATION

    /**
     * The decode width of the bitstream to be decoded.
     */
    DecodeWidth : UInt32

    /**
     * The decode height of the bitstream to be decoded.
     */
    DecodeHeight : UInt32

    /**
     * A [DXGI_FORMAT](/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format) structure specifying the format of the bitstream to be decoded.
     */
    Format : DXGI_FORMAT

    /**
     * The frame rate of the input video stream.  For more information, see the Remarks section.
     */
    FrameRate : DXGI_RATIONAL

    /**
     * The average bits per second data compression rate for the compressed video stream.  For more information, see the Remarks section.
     */
    BitRate : UInt32

    /**
     * The maximum number of decode picture buffers this stream can have.
     */
    MaxDecodePictureBufferCount : UInt32

}
