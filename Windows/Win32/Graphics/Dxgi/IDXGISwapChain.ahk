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
     * 
     * @param {Integer} SyncInterval 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    Present(SyncInterval, Flags) {
        result := ComCall(8, this, "uint", SyncInterval, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Buffer 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppSurface 
     * @returns {HRESULT} 
     */
    GetBuffer(Buffer, riid, ppSurface) {
        result := ComCall(9, this, "uint", Buffer, "ptr", riid, "ptr", ppSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Fullscreen 
     * @param {Pointer<IDXGIOutput>} pTarget 
     * @returns {HRESULT} 
     */
    SetFullscreenState(Fullscreen, pTarget) {
        result := ComCall(10, this, "int", Fullscreen, "ptr", pTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pFullscreen 
     * @param {Pointer<IDXGIOutput>} ppTarget 
     * @returns {HRESULT} 
     */
    GetFullscreenState(pFullscreen, ppTarget) {
        result := ComCall(11, this, "ptr", pFullscreen, "ptr", ppTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(12, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    ResizeBuffers(BufferCount, Width, Height, NewFormat, SwapChainFlags) {
        result := ComCall(13, this, "uint", BufferCount, "uint", Width, "uint", Height, "int", NewFormat, "uint", SwapChainFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MODE_DESC>} pNewTargetParameters 
     * @returns {HRESULT} 
     */
    ResizeTarget(pNewTargetParameters) {
        result := ComCall(14, this, "ptr", pNewTargetParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDXGIOutput>} ppOutput 
     * @returns {HRESULT} 
     */
    GetContainingOutput(ppOutput) {
        result := ComCall(15, this, "ptr", ppOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_FRAME_STATISTICS>} pStats 
     * @returns {HRESULT} 
     */
    GetFrameStatistics(pStats) {
        result := ComCall(16, this, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLastPresentCount 
     * @returns {HRESULT} 
     */
    GetLastPresentCount(pLastPresentCount) {
        result := ComCall(17, this, "uint*", pLastPresentCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
