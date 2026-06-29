#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk" { D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE }
#Import ".\D3D12_VIDEO_DECODE_CONFIGURATION.ahk" { D3D12_VIDEO_DECODE_CONFIGURATION }
#Import ".\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk" { D3D12_BITSTREAM_ENCRYPTION_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a ID3D12VideoDecoder.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decoder_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODER_DESC {
    #StructPack 4

    /**
     * The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * A [D3D12_VIDEO_DECODE_CONFIGURATION](ns-d3d12video-d3d12_video_decode_configuration.md) structure specifying the configuration of the video decoder.
     */
    Configuration : D3D12_VIDEO_DECODE_CONFIGURATION

}
