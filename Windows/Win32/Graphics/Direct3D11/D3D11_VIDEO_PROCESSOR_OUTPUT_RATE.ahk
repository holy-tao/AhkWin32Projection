#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the rate at which the video processor produces output frames from an input stream.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_output_rate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_PROCESSOR_OUTPUT_RATE extends Win32Enum {

    /**
     * The output is the normal frame rate.
     * Native name: D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * The output is half the frame rate.
     * Native name: D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_HALF
     * @type {Integer (Int32)}
     */
    static HALF => 1

    /**
     * The output is a custom frame rate.
     * Native name: D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 2
}
