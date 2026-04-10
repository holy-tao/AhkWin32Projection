#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_PROCESS_OUTPUT_STREAM.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Resource.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Specifies output stream arguments for the output passed to ID3D12VideoCommandList::ProcessFrames.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_output_stream_arguments
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * An array of [D3D12_VIDEO_PROCESS_OUTPUT_STREAM](ns-d3d12video-d3d12_video_process_output_stream.md) structures representing the output surfaces for the video process command.  If stereo output is enabled, index zero contains the left output while index 1 contains the right input.  If stereo output is not enabled, only index 0 is used to specify the output while index 1 should be set to nullptr.
     * @type {D3D12_VIDEO_PROCESS_OUTPUT_STREAM}
     */
    OutputStream {
        get {
            if(!this.HasProp("__OutputStreamProxyArray"))
                this.__OutputStreamProxyArray := Win32FixedArray(this.ptr + 0, 2, D3D12_VIDEO_PROCESS_OUTPUT_STREAM, "")
            return this.__OutputStreamProxyArray
        }
    }

    /**
     * The target rectangle is the area within the destination surface where the output will be drawn. The target rectangle is given in pixel coordinates, relative to the destination surface.
     * @type {RECT}
     */
    TargetRectangle {
        get {
            if(!this.HasProp("__TargetRectangle"))
                this.__TargetRectangle := RECT(32, this)
            return this.__TargetRectangle
        }
    }
}
