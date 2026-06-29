#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\DXGI_SWAP_EFFECT.ahk" { DXGI_SWAP_EFFECT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "Common\DXGI_SAMPLE_DESC.ahk" { DXGI_SAMPLE_DESC }
#Import "Common\DXGI_MODE_SCALING.ahk" { DXGI_MODE_SCALING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DXGI_USAGE.ahk" { DXGI_USAGE }
#Import "Common\DXGI_MODE_DESC.ahk" { DXGI_MODE_DESC }
#Import "Common\DXGI_MODE_SCANLINE_ORDER.ahk" { DXGI_MODE_SCANLINE_ORDER }

/**
 * Describes a swap chain. (DXGI_SWAP_CHAIN_DESC)
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getdesc">GetDesc</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">CreateSwapChain</a> methods.
 * 
 * In full-screen mode, there is a dedicated front buffer; in windowed mode, the desktop is the front buffer.
 * 
 * If you create a swap chain with one buffer, specifying <b>DXGI_SWAP_EFFECT_SEQUENTIAL</b> does not cause the contents of the single 
 *       buffer to be swapped with the front buffer.
 * 
 * For performance information about flipping swap-chain buffers in full-screen application, 
 *       see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">Full-Screen Application Performance Hints</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_swap_chain_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_SWAP_CHAIN_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structure that describes the backbuffer display mode.
     */
    BufferDesc : DXGI_MODE_DESC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that describes multi-sampling parameters.
     */
    SampleDesc : DXGI_SAMPLE_DESC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a> enumerated type that describes the surface usage and CPU access options for the back buffer. The back buffer can 
     *         be used for shader input or render-target output.
     */
    BufferUsage : DXGI_USAGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that describes the number of buffers in the swap chain. When you call  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">IDXGIFactory::CreateSwapChain</a> to create a full-screen swap chain, you typically include the front buffer in this value. For more information about swap-chain buffers, see Remarks.
     */
    BufferCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> handle to the output window. This member must not be <b>NULL</b>.
     */
    OutputWindow : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that specifies whether the output is in windowed mode. <b>TRUE</b> if the output is in windowed mode; otherwise, <b>FALSE</b>. 
     * 
     * We recommend that you create a windowed swap chain and allow the end user to change the swap chain to full screen through <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate">IDXGISwapChain::SetFullscreenState</a>; that is, do not set this member to FALSE to force the swap chain to be full screen. However, if you create the swap chain as full screen, also provide the end user with a list of supported display modes through the <b>BufferDesc</b> member because a swap chain that is created with an unsupported display mode might cause the display to go black and prevent the end user from seeing anything. 
     * 
     * For more information about choosing windowed verses full screen, see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">IDXGIFactory::CreateSwapChain</a>.
     */
    Windowed : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a> enumerated type that describes options for handling the contents of the presentation buffer after 
     *         presenting a surface.
     */
    SwapEffect : DXGI_SWAP_EFFECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a> enumerated type that describes options for swap-chain behavior.
     */
    Flags : UInt32

}
