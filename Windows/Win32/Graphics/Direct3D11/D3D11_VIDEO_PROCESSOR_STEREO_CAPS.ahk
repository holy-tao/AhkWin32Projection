#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines stereo 3D capabilities for a Microsoft Direct3D 11 video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_STEREO_CAPS{

    /**
     * The video processor supports the <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET</b> 
 *  format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_CAPS_MONO_OFFSET => 1

    /**
     * The video processor supports the <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_ROW_INTERLEAVED</b> 
 *  format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_CAPS_ROW_INTERLEAVED => 2

    /**
     * The video processor supports the <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_COLUMN_INTERLEAVED</b> 
 *  format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_CAPS_COLUMN_INTERLEAVED => 4

    /**
     * The video processor supports the <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_CHECKERBOARD</b> 
 *  format.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_CAPS_CHECKERBOARD => 8

    /**
     * The video processor can flip one or both views. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_flip_mode">D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_STEREO_CAPS_FLIP_MODE => 16
}
