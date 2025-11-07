#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\DXGI_MATRIX_3X2_F.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSourceSize", "GetSourceSize", "SetMaximumFrameLatency", "GetMaximumFrameLatency", "GetFrameLatencyWaitableObject", "SetMatrixTransform", "GetMatrixTransform"]

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setsourcesize
     */
    SetSourceSize(Width, Height) {
        result := ComCall(29, this, "uint", Width, "uint", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getsourcesize
     */
    GetSourceSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "uint*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MaxLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setmaximumframelatency
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(31, this, "uint", MaxLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getmaximumframelatency
     */
    GetMaximumFrameLatency() {
        result := ComCall(32, this, "uint*", &pMaxLatency := 0, "HRESULT")
        return pMaxLatency
    }

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getframelatencywaitableobject
     */
    GetFrameLatencyWaitableObject() {
        result := ComCall(33, this, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Pointer<DXGI_MATRIX_3X2_F>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setmatrixtransform
     */
    SetMatrixTransform(pMatrix) {
        result := ComCall(34, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DXGI_MATRIX_3X2_F} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getmatrixtransform
     */
    GetMatrixTransform() {
        pMatrix := DXGI_MATRIX_3X2_F()
        result := ComCall(35, this, "ptr", pMatrix, "HRESULT")
        return pMatrix
    }
}
