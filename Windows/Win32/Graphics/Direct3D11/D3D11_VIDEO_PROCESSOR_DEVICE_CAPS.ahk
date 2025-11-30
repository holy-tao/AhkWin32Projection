#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines video processing capabilities for a Microsoft Direct3D 11 video processor.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_device_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_DEVICE_CAPS extends Win32Enum{

    /**
     * The video processor can blend video content in linear color space. Most video content is gamma corrected, resulting in nonlinear values. This capability flag means that the video processor converts colors to linear space before blending, which produces better results.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_DEVICE_CAPS_LINEAR_SPACE => 1

    /**
     * The video processor supports the xvYCC color space for YCbCr data.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_DEVICE_CAPS_xvYCC => 2

    /**
     * The video processor can perform range conversion when the input and output are both RGB but use different color ranges (0-255 or 16-235, for 8-bit RGB).
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_DEVICE_CAPS_RGB_RANGE_CONVERSION => 4

    /**
     * The video processor can apply a matrix conversion to YCbCr values when the input and output are both YCbCr. For example, the driver can convert colors from BT.601 to BT.709.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_DEVICE_CAPS_YCbCr_MATRIX_CONVERSION => 8

    /**
     * The video processor supports YUV nominal range . 
     * 
     * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_DEVICE_CAPS_NOMINAL_RANGE => 16
}
