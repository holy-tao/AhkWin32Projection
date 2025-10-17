#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_FRAME_ARGUMENT.ahk
#Include .\D3D12_VIDEO_DECODE_REFERENCE_FRAMES.ahk
#Include .\D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM.ahk

/**
 * Specifies the parameters for the input stream for a video decode operation.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_decode_input_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * The count of frame parameters provided in the *FrameArguments* field. The maximum number of frame arguments is 10.
     * @type {Integer}
     */
    NumFrameArguments {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of [D3D12_VIDEO_DECODE_FRAME_ARGUMENT](ns-d3d12video-d3d12_video_decode_frame_argument.md) structures containing the parameters to decode a frame.
     * @type {Array<D3D12_VIDEO_DECODE_FRAME_ARGUMENT>}
     */
    FrameArguments{
        get {
            if(!this.HasProp("__FrameArgumentsProxyArray"))
                this.__FrameArgumentsProxyArray := Win32FixedArray(this.ptr + 8, 10, D3D12_VIDEO_DECODE_FRAME_ARGUMENT, "")
            return this.__FrameArgumentsProxyArray
        }
    }

    /**
     * A [D3D12_VIDEO_DECODE_REFERENCE_FRAMES](ns-d3d12video-d3d12_video_decode_reference_frames.md) structure containing the reference frames needed to decode a frame.
     * @type {D3D12_VIDEO_DECODE_REFERENCE_FRAMES}
     */
    ReferenceFrames{
        get {
            if(!this.HasProp("__ReferenceFrames"))
                this.__ReferenceFrames := D3D12_VIDEO_DECODE_REFERENCE_FRAMES(88, this)
            return this.__ReferenceFrames
        }
    }

    /**
     * A [D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM](ns-d3d12video-d3d12_video_decode_compressed_bitstream.md) structure representing the compressed bitstream in a single continuous buffer.
     * @type {D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM}
     */
    CompressedBitstream{
        get {
            if(!this.HasProp("__CompressedBitstream"))
                this.__CompressedBitstream := D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM(120, this)
            return this.__CompressedBitstream
        }
    }

    /**
     * An [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md) representing a pointer to the heap for the current decode resolution.
     * @type {Pointer<ID3D12VideoDecoderHeap>}
     */
    pHeap {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
