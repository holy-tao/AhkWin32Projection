#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\DXGI_RATIONAL.ahk

/**
 * Describes full-screen mode for a swap chain.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">CreateSwapChainForHwnd</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getfullscreendesc">GetFullscreenDesc</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_SWAP_CHAIN_FULLSCREEN_DESC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that describes the refresh rate in hertz.
     * @type {DXGI_RATIONAL}
     */
    RefreshRate{
        get {
            if(!this.HasProp("__RefreshRate"))
                this.__RefreshRate := DXGI_RATIONAL(0, this)
            return this.__RefreshRate
        }
    }

    /**
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173067(v=vs.85)">DXGI_MODE_SCANLINE_ORDER</a> enumerated type that describes the scan-line drawing mode.
     * @type {Integer}
     */
    ScanlineOrdering {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173066(v=vs.85)">DXGI_MODE_SCALING</a> enumerated type that describes the scaling mode.
     * @type {Integer}
     */
    Scaling {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A Boolean value that specifies whether the swap chain is in windowed mode. <b>TRUE</b> if the swap chain is in windowed mode; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    Windowed {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
