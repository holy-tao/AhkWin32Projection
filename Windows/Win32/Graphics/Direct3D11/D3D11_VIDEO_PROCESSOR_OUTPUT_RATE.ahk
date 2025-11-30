#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the rate at which the video processor produces output frames from an input stream.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_output_rate
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_OUTPUT_RATE extends Win32Enum{

    /**
     * The output is the normal frame rate.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_NORMAL => 0

    /**
     * The output is half the frame rate.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_HALF => 1

    /**
     * The output is a custom frame rate.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_CUSTOM => 2
}
