#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "Common\DXGI_MODE_SCANLINE_ORDER.ahk" { DXGI_MODE_SCANLINE_ORDER }
#Import "Common\DXGI_MODE_SCALING.ahk" { DXGI_MODE_SCALING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes full-screen mode for a swap chain.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">CreateSwapChainForHwnd</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getfullscreendesc">GetFullscreenDesc</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_SWAP_CHAIN_FULLSCREEN_DESC {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that describes the refresh rate in hertz.
     */
    RefreshRate : DXGI_RATIONAL

    /**
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173067(v=vs.85)">DXGI_MODE_SCANLINE_ORDER</a> enumerated type that describes the scan-line drawing mode.
     */
    ScanlineOrdering : DXGI_MODE_SCANLINE_ORDER

    /**
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173066(v=vs.85)">DXGI_MODE_SCALING</a> enumerated type that describes the scaling mode.
     */
    Scaling : DXGI_MODE_SCALING

    /**
     * A Boolean value that specifies whether the swap chain is in windowed mode. <b>TRUE</b> if the swap chain is in windowed mode; otherwise, <b>FALSE</b>.
     */
    Windowed : BOOL

}
