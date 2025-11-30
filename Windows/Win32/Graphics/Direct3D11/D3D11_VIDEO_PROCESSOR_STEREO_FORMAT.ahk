#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the layout in memory of a stereo 3D video frame.
 * @remarks
 * 
 * This enumeration designates the two stereo views as "frame 0" and "frame 1". The <i>LeftViewFrame0</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat">VideoProcessorSetStreamStereoFormat</a> method specifies which view is the left view, and which is the right view.
 * 
 * For packed formats, if the source rectangle clips part of the surface, the driver interprets the rectangle in logical coordinates relative to the stereo view,  rather than absolute pixel coordinates. The result is that frame 0 and frame 1 are clipped proportionately.
 * 
 * To query whether the device supports stereo 3D video, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check for the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_STEREO</b> flag in the <b>FeatureCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS</a> structure. If this capability flag is present, it means that the driver supports all of the stereo formats that are not  listed as optional. To find out which optional formats are supported, call <b>GetVideoProcessorCaps</b> and check the <b>StereoCaps</b> member of the structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_stereo_format
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_STEREO_FORMAT extends Win32Enum{

    /**
     * The sample does not contain stereo data.  If the stereo format is not specified, this value is the default.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO => 0

    /**
     * Frame 0 and frame 1 are packed side-by-side, as shown in the following diagram.
     * 
     * <img alt="Side-by-side packing" src="./images/dxgistereo3d02.png"/>
     * 
     * All drivers that support stereo video must support this format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_HORIZONTAL => 1

    /**
     * Frame 0 and frame 1 are packed top-to-bottom, as shown in the following diagram.
     * 
     * <img alt="Top-to-bottom packing" src="./images/dxgistereo3d01.png"/>
     * 
     * All drivers that support stereo video must support this format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_VERTICAL => 2

    /**
     * Frame 0 and frame 1 are placed in separate resources or in separate texture array elements within the same resource.
     * 
     * All drivers that support stereo video must support this format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE => 3

    /**
     * The sample contains non-stereo data. However, the driver should create a left/right output of this sample using a specified offset.  The offset is specified in the <i>MonoOffset</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat">ID3D11VideoContext::VideoProcessorSetStreamStereoFormat</a> method. 
     * 
     * This format is primarily intended for subtitles and other subpicture data, where the entire sample is presented on the same plane.
     * 
     * Support for this stereo format is optional.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET => 4

    /**
     * Frame 0 and frame 1 are packed into interleaved rows, as shown in the following diagram.
     * 
     * <img alt="Interleaved rows" src="./images/dxgistereo3d03.png"/>
     * 
     * Support for this stereo format is optional.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_ROW_INTERLEAVED => 5

    /**
     * Frame 0 and frame 1 are packed into interleaved columns, as shown in the following diagram.
     * 
     * <img alt="Interleaved columns" src="./images/dxgistereo3d04.png"/>
     * 
     * Support for this stereo format is optional.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_COLUMN_INTERLEAVED => 6

    /**
     * Frame 0 and frame 1 are packed in a checkerboard format, as shown in the following diagram.
     * 
     * <img alt="Checkerboard packing" src="./images/dxgistereo3d05.png"/>
     * 
     * Support for this stereo format is optional.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_CHECKERBOARD => 7
}
