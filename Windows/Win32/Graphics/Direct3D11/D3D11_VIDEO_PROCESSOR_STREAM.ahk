#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D11VideoProcessorInputView.ahk" { ID3D11VideoProcessorInputView }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains stream-level data for the ID3D11VideoContext::VideoProcessorBlt method.
 * @remarks
 * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, the <b>ppPastSurfaces</b>, <b>pInputSurface</b>, and <b>ppFutureSurfaces</b> members contain the left view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_stream
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_PROCESSOR_STREAM {
    #StructPack 8

    /**
     * Specifies whether this input stream is enabled. If the value is <b>TRUE</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">VideoProcessorBlt</a> method blits this stream to the output surface. Otherwise, this stream is not blitted. 
     * 
     * The maximum number of streams that can be enabled at one time is given in the <b>MaxInputStreams</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure.
     */
    Enable : BOOL

    /**
     * The zero-based index number of the output frame.
     */
    OutputIndex : UInt32

    /**
     * The zero-based index number of the input frame or field.
     */
    InputFrameOrField : UInt32

    /**
     * The number of past reference frames.
     */
    PastFrames : UInt32

    /**
     * The number of future reference frames.
     */
    FutureFrames : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> pointers, allocated by the caller. This array contains the past reference frames for the video processing operation. The number of elements in the array is equal to <b>PastFrames</b>.
     */
    ppPastSurfaces : ID3D11VideoProcessorInputView.Ptr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> interface of the surface that contains the current input frame.
     */
    pInputSurface : ID3D11VideoProcessorInputView

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> pointers, allocated by the caller. This array contains the future reference frames for the video processing operation. The number of elements in the array is equal to <b>FutureFrames</b>.
     */
    ppFutureSurfaces : ID3D11VideoProcessorInputView.Ptr

    /**
     * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, this member points to an array that contains the past reference frames for the right view. The number of elements in the array is equal to <b>PastFrames</b>.
     * 
     * For any other stereo 3D format, set this member to <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat">ID3D11VideoContext::VideoProcessorSetStreamStereoFormat</a>.
     */
    ppPastSurfacesRight : ID3D11VideoProcessorInputView.Ptr

    /**
     * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, this member contains a pointer to the current input frame for the right view. 
     * 
     * For any other stereo 3D format, set this member to <b>NULL</b>.
     */
    pInputSurfaceRight : ID3D11VideoProcessorInputView

    /**
     * If the stereo 3D format is <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>, this member points to an array that contains the future reference frames for the right view. The number of elements in the array is equal to <b>FutureFrames</b>.
     * 
     * For any other stereo 3D format, set this member to <b>NULL</b>.
     */
    ppFutureSurfacesRight : ID3D11VideoProcessorInputView.Ptr

}
