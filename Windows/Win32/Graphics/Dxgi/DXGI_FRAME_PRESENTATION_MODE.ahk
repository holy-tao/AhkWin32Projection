#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates options for presenting frames to the swap chain.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ns-dxgi1_3-dxgi_frame_statistics_media">DXGI_FRAME_STATISTICS_MEDIA</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ne-dxgi1_3-dxgi_frame_presentation_mode
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_FRAME_PRESENTATION_MODE extends Win32Enum{

    /**
     * Specifies that the presentation mode is a composition surface, meaning that the conversion from YUV to RGB is happening once per output refresh (for example, 60 Hz).
     *             When this value is returned, the media app should discontinue use of the decode swap chain and perform YUV to RGB conversion itself, reducing the frequency of YUV to RGB conversion to once per video frame.
     * @type {Integer (Int32)}
     */
    static DXGI_FRAME_PRESENTATION_MODE_COMPOSED => 0

    /**
     * Specifies that the presentation mode is an overlay surface, meaning that the YUV to RGB conversion is happening efficiently in hardware (once per video frame).
     *             When this value is returned, the media app can continue to use the decode swap chain.
     *             See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nn-dxgi1_3-idxgidecodeswapchain">IDXGIDecodeSwapChain</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FRAME_PRESENTATION_MODE_OVERLAY => 1

    /**
     * No presentation is specified.
     * @type {Integer (Int32)}
     */
    static DXGI_FRAME_PRESENTATION_MODE_NONE => 2

    /**
     * An  issue occurred that caused content protection to be invalidated in a swap-chain with hardware content protection, and is usually because the system ran out of hardware protected memory. The app will need to do one of the following:
     * 
     * <ul>
     * <li>Drastically reduce the amount of hardware protected memory used. For example, media applications might be able to reduce their buffering.
     * </li>
     * <li>Stop using hardware protection if possible.</li>
     * </ul>
     * Note that simply re-creating the swap chain or the device will usually have no impact as the DWM will continue to run out of memory and will return the same failure.
     * @type {Integer (Int32)}
     */
    static DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE => 3
}
