#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains stream-level data for the ID3D11VideoContext::VideoProcessorBlt method.
 * @remarks
 * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, the <b>ppPastSurfaces</b>, <b>pInputSurface</b>, and <b>ppFutureSurfaces</b> members contain the left view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_stream
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_STREAM extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies whether this input stream is enabled. If the value is <b>TRUE</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">VideoProcessorBlt</a> method blits this stream to the output surface. Otherwise, this stream is not blitted. 
     * 
     * The maximum number of streams that can be enabled at one time is given in the <b>MaxInputStreams</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure.
     * @type {Integer}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The zero-based index number of the output frame.
     * @type {Integer}
     */
    OutputIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The zero-based index number of the input frame or field.
     * @type {Integer}
     */
    InputFrameOrField {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of past reference frames.
     * @type {Integer}
     */
    PastFrames {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of future reference frames.
     * @type {Integer}
     */
    FutureFrames {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> pointers, allocated by the caller. This array contains the past reference frames for the video processing operation. The number of elements in the array is equal to <b>PastFrames</b>.
     * @type {Pointer<ID3D11VideoProcessorInputView>}
     */
    ppPastSurfaces {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> interface of the surface that contains the current input frame.
     * @type {Pointer<ID3D11VideoProcessorInputView>}
     */
    pInputSurface {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> pointers, allocated by the caller. This array contains the future reference frames for the video processing operation. The number of elements in the array is equal to <b>FutureFrames</b>.
     * @type {Pointer<ID3D11VideoProcessorInputView>}
     */
    ppFutureSurfaces {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, this member points to an array that contains the past reference frames for the right view. The number of elements in the array is equal to <b>PastFrames</b>.
     * 
     * For any other stereo 3D format, set this member to <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat">ID3D11VideoContext::VideoProcessorSetStreamStereoFormat</a>.
     * @type {Pointer<ID3D11VideoProcessorInputView>}
     */
    ppPastSurfacesRight {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, this member contains a pointer to the current input frame for the right view. 
     * 
     * For any other stereo 3D format, set this member to <b>NULL</b>.
     * @type {Pointer<ID3D11VideoProcessorInputView>}
     */
    pInputSurfaceRight {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, this member points to an array that contains the future reference frames for the right view. The number of elements in the array is equal to <b>FutureFrames</b>.
     * 
     * For any other stereo 3D format, set this member to <b>NULL</b>.
     * @type {Pointer<ID3D11VideoProcessorInputView>}
     */
    ppFutureSurfacesRight {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
