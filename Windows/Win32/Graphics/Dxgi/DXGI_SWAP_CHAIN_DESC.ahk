#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\DXGI_RATIONAL.ahk
#Include Common\DXGI_MODE_DESC.ahk
#Include Common\DXGI_SAMPLE_DESC.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes a swap chain.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getdesc">GetDesc</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">CreateSwapChain</a> methods.
  * 
  * In full-screen mode, there is a dedicated front buffer; in windowed mode, the desktop is the front buffer.
  * 
  * If you create a swap chain with one buffer, specifying <b>DXGI_SWAP_EFFECT_SEQUENTIAL</b> does not cause the contents of the single 
  *       buffer to be swapped with the front buffer.
  * 
  * For performance information about flipping swap-chain buffers in full-screen application, 
  *       see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">Full-Screen Application Performance Hints</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/ns-dxgi-dxgi_swap_chain_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_SWAP_CHAIN_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structure that describes the backbuffer display mode.
     * @type {DXGI_MODE_DESC}
     */
    BufferDesc{
        get {
            if(!this.HasProp("__BufferDesc"))
                this.__BufferDesc := DXGI_MODE_DESC(this.ptr + 0)
            return this.__BufferDesc
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that describes multi-sampling parameters.
     * @type {DXGI_SAMPLE_DESC}
     */
    SampleDesc{
        get {
            if(!this.HasProp("__SampleDesc"))
                this.__SampleDesc := DXGI_SAMPLE_DESC(this.ptr + 32)
            return this.__SampleDesc
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a> enumerated type that describes the surface usage and CPU access options for the back buffer. The back buffer can 
     *         be used for shader input or render-target output.
     * @type {Integer}
     */
    BufferUsage {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that describes the number of buffers in the swap chain. When you call  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">IDXGIFactory::CreateSwapChain</a> to create a full-screen swap chain, you typically include the front buffer in this value. For more information about swap-chain buffers, see Remarks.
     * @type {Integer}
     */
    BufferCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> handle to the output window. This member must not be <b>NULL</b>.
     * @type {HWND}
     */
    OutputWindow{
        get {
            if(!this.HasProp("__OutputWindow"))
                this.__OutputWindow := HWND(this.ptr + 48)
            return this.__OutputWindow
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that specifies whether the output is in windowed mode. <b>TRUE</b> if the output is in windowed mode; otherwise, <b>FALSE</b>. 
     * 
     * We recommend that you create a windowed swap chain and allow the end user to change the swap chain to full screen through <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate">IDXGISwapChain::SetFullscreenState</a>; that is, do not set this member to FALSE to force the swap chain to be full screen. However, if you create the swap chain as full screen, also provide the end user with a list of supported display modes through the <b>BufferDesc</b> member because a swap chain that is created with an unsupported display mode might cause the display to go black and prevent the end user from seeing anything. 
     * 
     * For more information about choosing windowed verses full screen, see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">IDXGIFactory::CreateSwapChain</a>.
     * @type {BOOL}
     */
    Windowed{
        get {
            if(!this.HasProp("__Windowed"))
                this.__Windowed := BOOL(this.ptr + 56)
            return this.__Windowed
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a> enumerated type that describes options for handling the contents of the presentation buffer after 
     *         presenting a surface.
     * @type {Integer}
     */
    SwapEffect {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a> enumerated type that describes options for swap-chain behavior.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
