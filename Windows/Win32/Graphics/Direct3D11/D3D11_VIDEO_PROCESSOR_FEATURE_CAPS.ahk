#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines features that a Microsoft Direct3D 11 video processor can support.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_feature_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_FEATURE_CAPS{

    /**
     * The video processor can set alpha values on the output pixels. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputalphafillmode">ID3D11VideoContext::VideoProcessorSetOutputAlphaFillMode</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALPHA_FILL => 1

    /**
     * The video processor can downsample the video output. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputconstriction">ID3D11VideoContext::VideoProcessorSetOutputConstriction</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_CONSTRICTION => 2

    /**
     * The video processor can perform luma keying. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamlumakey">ID3D11VideoContext::VideoProcessorSetStreamLumaKey</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_LUMA_KEY => 4

    /**
     * The video processor can apply alpha values from color palette entries.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALPHA_PALETTE => 8

    /**
     * The driver does not support full video processing capabilities. If this capability flag is set, the video processor has the following limitations:
 * 
 * <ul>
 * <li>A maximum of two streams are supported:<ul>
 * <li>The first stream must be either NV12 or YUY2.</li>
 * <li>The second stream must be AYUV, AI44, or IA44.</li>
 * </ul>
 * </li>
 * <li>Image adjustment (proc amp) controls are applied to the entire video processing blit, rather than per stream.</li>
 * <li>Support for per-stream planar alpha is not reliable. (Per-pixel alpha is supported, however.)</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_LEGACY => 16

    /**
     * The video processor can support 3D stereo video. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat">ID3D11VideoContext::VideoProcessorSetStreamStereoFormat</a>.
 * 
 * All drivers setting this caps must support the following stereo formats: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_format">D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_HORIZONTAL</a>, <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_VERTICAL</b>, and <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b>.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_STEREO => 32

    /**
     * The driver can rotate the input data either 90, 180, or 270 degrees clockwise as part of the video processing operation.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ROTATION => 64

    /**
     * The driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamalpha">VideoProcessorSetStreamAlpha</a> call.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALPHA_STREAM => 128

    /**
     * The driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreampixelaspectratio">VideoProcessorSetStreamPixelAspectRatio</a> call.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_PIXEL_ASPECT_RATIO => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_MIRROR => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_SHADER_USAGE => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_METADATA_HDR10 => 2048
}
