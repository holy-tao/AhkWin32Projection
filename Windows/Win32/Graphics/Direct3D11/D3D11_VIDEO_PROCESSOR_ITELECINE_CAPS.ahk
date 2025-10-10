#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the inverse telecine (IVTC) capabilities of a video processor.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_itelecine_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS{

    /**
     * The video processor can reverse 3:2 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_32 => 1

    /**
     * The video processor can reverse 2:2 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_22 => 2

    /**
     * The video processor can reverse 2:2:2:4 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_2224 => 4

    /**
     * The video processor can reverse 2:3:3:2 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_2332 => 8

    /**
     * The video processor can reverse 3:2:3:2:2 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_32322 => 16

    /**
     * The video processor can reverse 5:5 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_55 => 32

    /**
     * The video processor can reverse 6:4 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_64 => 64

    /**
     * The video processor can reverse 8:7 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_87 => 128

    /**
     * The video processor can reverse 2:2:2:2:2:2:2:2:2:2:2:3 pulldown.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_222222222223 => 256

    /**
     * The video processor can reverse other telecine modes not listed here.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_ITELECINE_CAPS_OTHER => -2147483648
}
