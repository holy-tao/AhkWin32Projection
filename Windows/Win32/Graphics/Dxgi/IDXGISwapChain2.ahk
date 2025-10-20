#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IDXGISwapChain1.ahk

/**
 * Extends IDXGISwapChain1 with methods to support swap back buffer scaling and lower-latency swap chains.
 * @remarks
 * 
  * You can create a swap chain by 
  * calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgiswapchain2
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain2 extends IDXGISwapChain1{
    /**
     * The interface identifier for IDXGISwapChain2
     * @type {Guid}
     */
    static IID => Guid("{a8be2ac4-199f-4946-b331-79599fb98de7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    SetSourceSize(Width, Height) {
        result := ComCall(29, this, "uint", Width, "uint", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pWidth 
     * @param {Pointer<UInt32>} pHeight 
     * @returns {HRESULT} 
     */
    GetSourceSize(pWidth, pHeight) {
        result := ComCall(30, this, "uint*", pWidth, "uint*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MaxLatency 
     * @returns {HRESULT} 
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(31, this, "uint", MaxLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMaxLatency 
     * @returns {HRESULT} 
     */
    GetMaximumFrameLatency(pMaxLatency) {
        result := ComCall(32, this, "uint*", pMaxLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    GetFrameLatencyWaitableObject() {
        result := ComCall(33, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MATRIX_3X2_F>} pMatrix 
     * @returns {HRESULT} 
     */
    SetMatrixTransform(pMatrix) {
        result := ComCall(34, this, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MATRIX_3X2_F>} pMatrix 
     * @returns {HRESULT} 
     */
    GetMatrixTransform(pMatrix) {
        result := ComCall(35, this, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
