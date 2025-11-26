#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DSwapChain9.ahk

/**
 * Applications use the methods of the IDirect3DSwapChain9Ex interface to manipulate a swap chain.
 * @remarks
 * 
 * There is always at least one swap chain for each device, known as the implicit swap chain. However, an additional swap chain for rendering multiple views from the same device can be created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">CreateAdditionalSwapChain</a> method.
 * 
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The <b>LPDIRECT3DSWAPCHAIN9</b> and <b>PDIRECT3DSWAPCHAIN9</b> types are defined as pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> interface.
 * 
 * <b>IDirect3DSwapChain9Ex</b> objects are returned as a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> object when <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getswapchain">GetSwapChain</a> is called on an instance of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex">IDirect3DDevice9Ex</a>.
 * The <b>IDirect3DSwapChain9Ex</b> interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the instance of <b>IDirect3DSwapChain9</b> that was returned by <b>GetSwapChain</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3dswapchain9ex
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DSwapChain9Ex extends IDirect3DSwapChain9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DSwapChain9Ex
     * @type {Guid}
     */
    static IID => Guid("{91886caf-1c3d-4d2e-a0ab-3e4c7d8d3303}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastPresentCount", "GetPresentStats", "GetDisplayModeEx"]

    /**
     * Returns the number of times the swapchain has been processed.
     * @param {Pointer<Integer>} pLastPresentCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a UINT to be filled with the number of times the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-presentex">IDirect3DDevice9Ex::PresentEx</a> method has been called. The count will also be incremented by calling some other APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdialogboxmode">IDirect3DDevice9::SetDialogBoxMode</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * S_OK the method was successful.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dswapchain9ex-getlastpresentcount
     */
    GetLastPresentCount(pLastPresentCount) {
        pLastPresentCountMarshal := pLastPresentCount is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pLastPresentCountMarshal, pLastPresentCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DPRESENTSTATS>} pPresentationStatistics 
     * @returns {HRESULT} 
     */
    GetPresentStats(pPresentationStatistics) {
        result := ComCall(11, this, "ptr", pPresentationStatistics, "HRESULT")
        return result
    }

    /**
     * Retrieves the display mode's spatial resolution, color resolution, refresh frequency, and rotation settings.
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode.
     * @param {Pointer<Integer>} pRotation Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a> indicating the type of screen rotation the application will do. The value returned through this pointer is important when the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresentflag">D3DPRESENTFLAG_NOAUTOROTATE</a> flag is used; otherwise, it can be set to <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3dswapchain9ex-getdisplaymodeex
     */
    GetDisplayModeEx(pMode, pRotation) {
        pRotationMarshal := pRotation is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pMode, pRotationMarshal, pRotation, "HRESULT")
        return result
    }
}
