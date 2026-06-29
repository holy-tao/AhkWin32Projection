#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_DECODE_FRAME_ARGUMENT.ahk" { D3D12_VIDEO_DECODE_FRAME_ARGUMENT }
#Import ".\D3D12_VIDEO_DECODE_ARGUMENT_TYPE.ahk" { D3D12_VIDEO_DECODE_ARGUMENT_TYPE }
#Import ".\D3D12_VIDEO_DECODE_REFERENCE_FRAMES.ahk" { D3D12_VIDEO_DECODE_REFERENCE_FRAMES }
#Import ".\D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM.ahk" { D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM }
#Import ".\ID3D12VideoDecoderHeap.ahk" { ID3D12VideoDecoderHeap }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Specifies the parameters for the input stream for a video decode operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_input_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS {
    #StructPack 8

    /**
     * The count of frame parameters provided in the *FrameArguments* field. The maximum number of frame arguments is 10.
     */
    NumFrameArguments : UInt32

    /**
     * An array of [D3D12_VIDEO_DECODE_FRAME_ARGUMENT](ns-d3d12video-d3d12_video_decode_frame_argument.md) structures containing the parameters to decode a frame.
     */
    FrameArguments : D3D12_VIDEO_DECODE_FRAME_ARGUMENT[10]

    /**
     * A [D3D12_VIDEO_DECODE_REFERENCE_FRAMES](ns-d3d12video-d3d12_video_decode_reference_frames.md) structure containing the reference frames needed to decode a frame.
     */
    ReferenceFrames : D3D12_VIDEO_DECODE_REFERENCE_FRAMES

    /**
     * A [D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM](ns-d3d12video-d3d12_video_decode_compressed_bitstream.md) structure representing the compressed bitstream in a single continuous buffer.
     */
    CompressedBitstream : D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM

    /**
     * An [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md) representing a pointer to the heap for the current decode resolution.
     */
    pHeap : ID3D12VideoDecoderHeap

}
