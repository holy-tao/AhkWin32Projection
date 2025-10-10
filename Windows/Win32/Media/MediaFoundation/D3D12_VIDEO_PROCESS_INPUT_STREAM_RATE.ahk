#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the stream rate.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_process_input_stream_rate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The zero-based index number of the output frame. The OutputIndex member is a zero-based cyclic number that indicates the frame index number of the output. The driver uses this output-index information to perform the video processing in a certain pattern or cycle, especially when the driver performs deinterlacing or frame-rate conversion. For example, with the following output-index pattern, the driver performs the indicated video processing:
     * 
     * - Progressive format at normal and half rate: 
     *  - *OutputInde* = 0, 0,...
     * - Progressive format at 2/1 custom rate (double frame-rate conversion, OutputFrames=2): 
     *  - *OutputInde* = 0, 1, 0, 1,...
     * - Interlaced format at normal rate: 
     *  - *OutputInde* = 0, 1, 0, 1,... (0: first field, 1: second field)
     * - Interlaced format at half rate: 
     *  - *OutputInde* = 0, 0,... (for example, first and second fields are blended to one frame)
     * - Interlaced at 4/5 custom rate (3:2 inverse telecine, OutputFrames=4): 
     *  - *OutputInde* = 0, 1, 2, 3, 0, 1, 2, 3,... (0:A, 1:B, 2:C, 3:D film frame)
     * @type {Integer}
     */
    OutputIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The zero-based index number of the input frame or field. The InputFrameOrField member is a zero-based number that indicates the frame or the field number of the input surface. For example, with the following input-frame-or-field number, the driver can perform the indicated video processing: 
     * 
     * - Progressive format and interlaced format at normal rate: 
     *   - *InputFrameOrField* = 0, 1, 2,...
     * - Progressive format and interlaced format at half rate: 
     *   - *InputFrameOrField* = 0, 2, 4,...
     * - Interlaced format at 4/5 custom rate (3:2 inverse telecine, OutputFrames=4 and InputFrameOrField=10): 
     *   - *InputFrameOrField* = 0, 0, 0, 0, 10, 10, 10, 10, 20, 20, 20, 20,...
     * - Interlaced format at 4/15 custom rate (8:7 inverse telecine, OutputFrames=2 and InputFrameOrField=15): 
     *   - *InputFrameOrField* = 0, 0, 15, 15, 30, 30,...
     * @type {Integer}
     */
    InputFrameOrField {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
