#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDeviceSubObject.ahk

/**
 * An IDXGISwapChain interface implements one or more surfaces for storing rendered data before presenting it to an output.
 * @remarks
 * 
  * You can create a swap chain by 
  * calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. You can also create a swap chain when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>; however, you can then only access the sub-set of swap-chain functionality that the <b>IDXGISwapChain</b> interface provides.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgiswapchain
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain extends IDXGIDeviceSubObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain
     * @type {Guid}
     */
    static IID => Guid("{310d36a0-d2e7-4c0a-aa04-6a9d23b8886a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Present", "GetBuffer", "SetFullscreenState", "GetFullscreenState", "GetDesc", "ResizeBuffers", "ResizeTarget", "GetContainingOutput", "GetFrameStatistics", "GetLastPresentCount"]

    /**
     * 
     * @param {Integer} SyncInterval 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-present
     */
    Present(SyncInterval, Flags) {
        result := ComCall(8, this, "uint", SyncInterval, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Buffer 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getbuffer
     */
    GetBuffer(Buffer, riid, ppSurface) {
        result := ComCall(9, this, "uint", Buffer, "ptr", riid, "ptr*", ppSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Fullscreen 
     * @param {IDXGIOutput} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate
     */
    SetFullscreenState(Fullscreen, pTarget) {
        result := ComCall(10, this, "int", Fullscreen, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pFullscreen 
     * @param {Pointer<IDXGIOutput>} ppTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getfullscreenstate
     */
    GetFullscreenState(pFullscreen, ppTarget) {
        result := ComCall(11, this, "ptr", pFullscreen, "ptr*", ppTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(12, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BufferCount 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} NewFormat 
     * @param {Integer} SwapChainFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-resizebuffers
     */
    ResizeBuffers(BufferCount, Width, Height, NewFormat, SwapChainFlags) {
        result := ComCall(13, this, "uint", BufferCount, "uint", Width, "uint", Height, "int", NewFormat, "uint", SwapChainFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MODE_DESC>} pNewTargetParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-resizetarget
     */
    ResizeTarget(pNewTargetParameters) {
        result := ComCall(14, this, "ptr", pNewTargetParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDXGIOutput>} ppOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput
     */
    GetContainingOutput(ppOutput) {
        result := ComCall(15, this, "ptr*", ppOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_FRAME_STATISTICS>} pStats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getframestatistics
     */
    GetFrameStatistics(pStats) {
        result := ComCall(16, this, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLastPresentCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getlastpresentcount
     */
    GetLastPresentCount(pLastPresentCount) {
        result := ComCall(17, this, "uint*", pLastPresentCount, "HRESULT")
        return result
    }
}
