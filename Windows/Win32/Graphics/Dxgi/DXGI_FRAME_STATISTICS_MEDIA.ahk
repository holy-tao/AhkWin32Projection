#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_FRAME_PRESENTATION_MODE.ahk" { DXGI_FRAME_PRESENTATION_MODE }

/**
 * Used to verify system approval for the app's custom present duration (custom refresh rate).
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgiswapchainmedia-getframestatisticsmedia">GetFrameStatisticsMedia</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_frame_statistics_media
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_FRAME_STATISTICS_MEDIA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that represents the running total count of times that an image was presented to the monitor since the computer booted.
     * 
     * <div class="alert"><b>Note</b>  The number of times that an image was presented to the monitor is not necessarily the same as the number of times 
     *         that you called <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a>.</div>
     * <div> </div>
     */
    PresentCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that represents  the running total count of v-blanks at which the last image was presented to the monitor and that have happened since the computer booted (for windowed mode, since the swap chain was created).
     */
    PresentRefreshCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that represents  the running total count of v-blanks when the scheduler last sampled the machine time by calling <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> and that have happened since the computer booted (for windowed mode, since the swap chain was created).
     */
    SyncRefreshCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * A value that represents the high-resolution performance counter timer. 
     *         This value is the same as the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> 
     *         function.
     */
    SyncQPCTime : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * Reserved. Always returns 0.
     */
    SyncGPUTime : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ne-dxgi1_3-dxgi_frame_presentation_mode">DXGI_FRAME_PRESENTATION_MODE</a></b>
     * 
     * A value indicating the composition presentation mode. This value is used to determine whether the app should continue to use the decode swap chain. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ne-dxgi1_3-dxgi_frame_presentation_mode">DXGI_FRAME_PRESENTATION_MODE</a>.
     */
    CompositionMode : DXGI_FRAME_PRESENTATION_MODE

    /**
     * Type: <b>UINT</b>
     * 
     * If the system approves an app's custom present duration request, this field is set to the approved custom present duration.
     * 
     * If the app's custom present duration request is not approved, this field is set to zero.
     */
    ApprovedPresentDuration : UInt32

}
