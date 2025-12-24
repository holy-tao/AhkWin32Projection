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
     * Sets the source region to be used for the swap chain.
     * @param {Integer} Width Source width to use for the swap chain. This value must be greater than zero, and must be less than or equal to the overall width of the swap chain.
     * @param {Integer} Height Source height to use for the swap chain. This value must be greater than zero, and must be less than or equal to the overall height of the swap chain.
     * @returns {HRESULT} This method can return:
     * 
     * <ul>
     * <li>E_INVALIDARG if one or more parameters exceed the size of the back buffer.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setsourcesize
     */
    SetSourceSize(Width, Height) {
        result := ComCall(29, this, "uint", Width, "uint", Height, "HRESULT")
        return result
    }

    /**
     * Gets the source region used for the swap chain.
     * @param {Pointer<Integer>} pWidth The current width of the source region of the swap chain. This value can range from 1 to the overall width of the swap chain.
     * @param {Pointer<Integer>} pHeight The current height of the source region of the swap chain. This value can range from 1 to the overall height of the swap chain.
     * @returns {HRESULT} This method can return error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getsourcesize
     */
    GetSourceSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "uint*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * Sets the number of frames that the swap chain is allowed to queue for rendering.
     * @param {Integer} MaxLatency The maximum number of back buffer frames that will be queued for the swap chain. This value is 1 by default.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, DXGI_ERROR_DEVICE_REMOVED if the device was removed.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setmaximumframelatency
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(31, this, "uint", MaxLatency, "HRESULT")
        return result
    }

    /**
     * Gets the number of frames that the swap chain is allowed to queue for rendering.
     * @returns {Integer} The maximum number of back buffer frames that will be queued for the swap chain. This value is 1 by default, but should be set to 2 if the scene takes longer than it takes for one vertical refresh (typically about 16ms) to draw.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getmaximumframelatency
     */
    GetMaximumFrameLatency() {
        result := ComCall(32, this, "uint*", &pMaxLatency := 0, "HRESULT")
        return pMaxLatency
    }

    /**
     * Returns a waitable handle that signals when the DXGI adapter has finished presenting a new frame.
     * @returns {HANDLE} A handle to the waitable object, or NULL if the swap chain was not created with <a href="/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getframelatencywaitableobject
     */
    GetFrameLatencyWaitableObject() {
        result := ComCall(33, this, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Sets the transform matrix that will be applied to a composition swap chain upon the next present.
     * @param {Pointer<DXGI_MATRIX_3X2_F>} pMatrix The transform matrix to use for swap chain scaling and translation. This function can only be used with composition swap chains created by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. Only scale and translation components are allowed in the matrix.
     * @returns {HRESULT} <b>SetMatrixTransform</b> returns:
     * <ul>
     * <li>S_OK if it successfully retrieves the transform matrix.</li>
     * <li>E_INVALIDARG if the <i>pMatrix</i> parameter is incorrect, for example, <i>pMatrix</i> is NULL or the matrix represented by <a href="/windows/desktop/api/dxgi1_3/ns-dxgi1_3-dxgi_matrix_3x2_f">DXGI_MATRIX_3X2_F</a> includes components other than scale and translation.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the method is called on a swap chain that was not created with <a href="/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">CreateSwapChainForComposition</a>.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setmatrixtransform
     */
    SetMatrixTransform(pMatrix) {
        result := ComCall(34, this, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * Gets the transform matrix that will be applied to a composition swap chain upon the next present.
     * @returns {DXGI_MATRIX_3X2_F} [out]
     * 
     * The transform matrix currently used for swap chain scaling and translation.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgiswapchain2-getmatrixtransform
     */
    GetMatrixTransform() {
        pMatrix := DXGI_MATRIX_3X2_F()
        result := ComCall(35, this, "ptr", pMatrix, "HRESULT")
        return pMatrix
    }
}
