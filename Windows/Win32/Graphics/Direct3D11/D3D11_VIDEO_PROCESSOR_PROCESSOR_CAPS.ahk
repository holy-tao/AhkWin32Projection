#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies video processing capabilities that relate to deinterlacing, inverse telecine (IVTC), and frame-rate conversion.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_processor_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS extends Win32Enum{

    /**
     * The video processor can perform blend deinterlacing.
     * 
     * 
     * 
     * In blend deinterlacing, the two fields from an interlaced frame are blended into a single progressive frame. A video processor uses blend deinterlacing when it deinterlaces at half rate, as when converting 60i to 30p. Blend deinterlacing does not require reference frames.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS_DEINTERLACE_BLEND => 1

    /**
     * The video processor can perform bob deinterlacing.
     * 
     * In bob deinterlacing, missing field lines are interpolated from the lines above and below. Bob deinterlacing does not require reference frames.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS_DEINTERLACE_BOB => 2

    /**
     * The video processor can perform adaptive deinterlacing.
     * 
     * Adaptive deinterlacing uses spatial or temporal interpolation, and switches between the two on a field-by-field basis, depending on the amount of motion. If the video processor does not receive enough reference frames to perform adaptive deinterlacing, it falls back to bob deinterlacing.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS_DEINTERLACE_ADAPTIVE => 4

    /**
     * The video processor can perform motion-compensated deinterlacing.
     * 
     * 
     * 
     * Motion-compensated deinterlacing uses motion vectors to recreate missing lines. If the video processor does not receive enough reference frames to perform motion-compensated deinterlacing, it falls back to bob deinterlacing.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS_DEINTERLACE_MOTION_COMPENSATION => 8

    /**
     * The video processor can perform inverse telecine (IVTC).
     * 
     * 
     * 
     * If the video processor supports this capability, the <b>ITelecineCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure specifies which IVTC modes are supported.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS_INVERSE_TELECINE => 16

    /**
     * The video processor can convert the frame rate by interpolating frames.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_PROCESSOR_CAPS_FRAME_RATE_CONVERSION => 32
}
