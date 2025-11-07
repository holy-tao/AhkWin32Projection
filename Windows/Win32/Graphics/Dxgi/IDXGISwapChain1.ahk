#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_SWAP_CHAIN_DESC1.ahk
#Include .\DXGI_SWAP_CHAIN_FULLSCREEN_DESC.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IDXGIOutput.ahk
#Include .\DXGI_RGBA.ahk
#Include .\IDXGISwapChain.ahk

/**
 * Provides presentation capabilities that are enhanced from IDXGISwapChain. These presentation capabilities consist of specifying dirty rectangles and scroll rectangle to optimize the presentation.
 * @remarks
 * 
  * You can create a swap chain by 
  * calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. You can also create a swap chain when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>; however, you can then only access the sub-set of swap-chain functionality that the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a> interface provides.
  * 
  * <b>IDXGISwapChain1</b> provides the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-istemporarymonosupported">IsTemporaryMonoSupported</a> method that you can use to determine whether the swap chain supports "temporary mono” presentation. This type of swap chain is a stereo swap chain that can be used to present mono content.
  * 
  * 
  * <div class="alert"><b>Note</b>  Some stereo features like the advanced presentation flags are not represented by an explicit interface change.  Furthermore, the original (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>) and new (<b>IDXGISwapChain1</b>) swap chain interfaces generally have the same behavior. For information about how <b>IDXGISwapChain</b> methods are translated into <b>IDXGISwapChain1</b> methods, see the descriptions of the <b>IDXGISwapChain1</b> methods.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgiswapchain1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain1 extends IDXGISwapChain{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain1
     * @type {Guid}
     */
    static IID => Guid("{790a45f7-0d42-4876-983a-0a55cfe6f4aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1", "GetFullscreenDesc", "GetHwnd", "GetCoreWindow", "Present1", "IsTemporaryMonoSupported", "GetRestrictToOutput", "SetBackgroundColor", "GetBackgroundColor", "SetRotation", "GetRotation"]

    /**
     * 
     * @returns {DXGI_SWAP_CHAIN_DESC1} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1
     */
    GetDesc1() {
        pDesc := DXGI_SWAP_CHAIN_DESC1()
        result := ComCall(18, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @returns {DXGI_SWAP_CHAIN_FULLSCREEN_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getfullscreendesc
     */
    GetFullscreenDesc() {
        pDesc := DXGI_SWAP_CHAIN_FULLSCREEN_DESC()
        result := ComCall(19, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-gethwnd
     */
    GetHwnd() {
        pHwnd := HWND()
        result := ComCall(20, this, "ptr", pHwnd, "HRESULT")
        return pHwnd
    }

    /**
     * 
     * @param {Pointer<Guid>} refiid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getcorewindow
     */
    GetCoreWindow(refiid) {
        result := ComCall(21, this, "ptr", refiid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * 
     * @param {Integer} SyncInterval 
     * @param {Integer} PresentFlags 
     * @param {Pointer<DXGI_PRESENT_PARAMETERS>} pPresentParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1
     */
    Present1(SyncInterval, PresentFlags, pPresentParameters) {
        result := ComCall(22, this, "uint", SyncInterval, "uint", PresentFlags, "ptr", pPresentParameters, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-istemporarymonosupported
     */
    IsTemporaryMonoSupported() {
        result := ComCall(23, this, "int")
        return result
    }

    /**
     * 
     * @returns {IDXGIOutput} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getrestricttooutput
     */
    GetRestrictToOutput() {
        result := ComCall(24, this, "ptr*", &ppRestrictToOutput := 0, "HRESULT")
        return IDXGIOutput(ppRestrictToOutput)
    }

    /**
     * 
     * @param {Pointer<DXGI_RGBA>} pColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-setbackgroundcolor
     */
    SetBackgroundColor(pColor) {
        result := ComCall(25, this, "ptr", pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DXGI_RGBA} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getbackgroundcolor
     */
    GetBackgroundColor() {
        pColor := DXGI_RGBA()
        result := ComCall(26, this, "ptr", pColor, "HRESULT")
        return pColor
    }

    /**
     * 
     * @param {Integer} Rotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-setrotation
     */
    SetRotation(Rotation) {
        result := ComCall(27, this, "int", Rotation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getrotation
     */
    GetRotation() {
        result := ComCall(28, this, "int*", &pRotation := 0, "HRESULT")
        return pRotation
    }
}
