#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_PROCESS_REFERENCE_SET.ahk
#Include .\D3D12_VIDEO_PROCESS_INPUT_STREAM.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\D3D12_VIDEO_PROCESS_TRANSFORM.ahk
#Include .\D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_VIDEO_PROCESS_ALPHA_BLENDING.ahk

/**
 * Specifies input stream arguments for an input stream passed to ID3D12VideoCommandList::ProcessFrames.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_process_input_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * An array of [D3D12_VIDEO_PROCESS_INPUT_STREAM](ns-d3d12video-d3d12_video_process_input_stream.md) structures containing the set of references for video processing. If the stereo format is [D3D12_VIDEO_PROCESS_STEREO_FORMAT_SEPARATE](ne-d3d12video-d3d12_video_frame_stereo_format.md), then two sets of input streams must be supplied.  For all other stereo formats, the first set of reference must be supplied, and the second should be zero initialized.
     * @type {Array<D3D12_VIDEO_PROCESS_INPUT_STREAM>}
     */
    InputStream{
        get {
            if(!this.HasProp("__InputStreamProxyArray"))
                this.__InputStreamProxyArray := Win32FixedArray(this.ptr + 0, 2, D3D12_VIDEO_PROCESS_INPUT_STREAM, "")
            return this.__InputStreamProxyArray
        }
    }

    /**
     * A [D3D12_VIDEO_PROCESS_TRANSFORM](ns-d3d12video-d3d12_video_process_transform.md) structure specifying the flip, rotation, scale and destination translation for the video input.
     * @type {D3D12_VIDEO_PROCESS_TRANSFORM}
     */
    Transform{
        get {
            if(!this.HasProp("__Transform"))
                this.__Transform := D3D12_VIDEO_PROCESS_TRANSFORM(this.ptr + 16)
            return this.__Transform
        }
    }

    /**
     * A value from the [D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS](ne-d3d12video-d3d12_video_process_input_stream_flags.md) enumeration specifying the options for the input stream.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * A [D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE](ns-d3d12video-d3d12_video_process_input_stream_rate.md) structure specifying the framerate and input and output indicies for framerate conversion and deinterlacing.
     * @type {D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE}
     */
    RateInfo{
        get {
            if(!this.HasProp("__RateInfo"))
                this.__RateInfo := D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE(this.ptr + 64)
            return this.__RateInfo
        }
    }

    /**
     * The level to apply for each enabled filter.  The filter level is specified in the order that filters appear in the [D3D12_VIDEO_PROCESS_FILTER_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration.  Specify 0 if a filter is not enabled or the filter index is reserved.
     * @type {Array<Int32>}
     */
    FilterLevels{
        get {
            if(!this.HasProp("__FilterLevelsProxyArray"))
                this.__FilterLevelsProxyArray := Win32FixedArray(this.ptr + 72, 32, Primitive, "int")
            return this.__FilterLevelsProxyArray
        }
    }

    /**
     * A [D3D12_VIDEO_PROCESS_ALPHA_BLENDING](ns-d3d12video-d3d12_video_process_alpha_blending.md) structure specifying the planar alpha for an input stream on the video processor.
     * @type {D3D12_VIDEO_PROCESS_ALPHA_BLENDING}
     */
    AlphaBlending{
        get {
            if(!this.HasProp("__AlphaBlending"))
                this.__AlphaBlending := D3D12_VIDEO_PROCESS_ALPHA_BLENDING(this.ptr + 200)
            return this.__AlphaBlending
        }
    }
}
