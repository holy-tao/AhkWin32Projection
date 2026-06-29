#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3DDISPLAYMODEEX.ahk" { D3DDISPLAYMODEEX }
#Import ".\IDirect3DSwapChain9.ahk" { IDirect3DSwapChain9 }
#Import ".\D3DPRESENTSTATS.ahk" { D3DPRESENTSTATS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3DDISPLAYROTATION.ahk" { D3DDISPLAYROTATION }

/**
 * Applications use the methods of the IDirect3DSwapChain9Ex interface to manipulate a swap chain.
 * @remarks
 * There is always at least one swap chain for each device, known as the implicit swap chain. However, an additional swap chain for rendering multiple views from the same device can be created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">CreateAdditionalSwapChain</a> method.
 * 
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The <b>LPDIRECT3DSWAPCHAIN9</b> and <b>PDIRECT3DSWAPCHAIN9</b> types are defined as pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> interface.
 * 
 * <b>IDirect3DSwapChain9Ex</b> objects are returned as a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> object when <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getswapchain">GetSwapChain</a> is called on an instance of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex">IDirect3DDevice9Ex</a>.
 * The <b>IDirect3DSwapChain9Ex</b> interface is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the instance of <b>IDirect3DSwapChain9</b> that was returned by <b>GetSwapChain</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dswapchain9ex
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DSwapChain9Ex extends IDirect3DSwapChain9 {
    /**
     * The interface identifier for IDirect3DSwapChain9Ex
     * @type {Guid}
     */
    static IID := Guid("{91886caf-1c3d-4d2e-a0ab-3e4c7d8d3303}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DSwapChain9Ex interfaces
    */
    struct Vtbl extends IDirect3DSwapChain9.Vtbl {
        GetLastPresentCount : IntPtr
        GetPresentStats     : IntPtr
        GetDisplayModeEx    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DSwapChain9Ex.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the number of times the swapchain has been processed.
     * @param {Pointer<Integer>} pLastPresentCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a UINT to be filled with the number of times the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-presentex">IDirect3DDevice9Ex::PresentEx</a> method has been called. The count will also be incremented by calling some other APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdialogboxmode">IDirect3DDevice9::SetDialogBoxMode</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * S_OK the method was successful.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9ex-getlastpresentcount
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
        result := ComCall(11, this, D3DPRESENTSTATS.Ptr, pPresentationStatistics, "HRESULT")
        return result
    }

    /**
     * Retrieves the display mode's spatial resolution, color resolution, refresh frequency, and rotation settings. (IDirect3DSwapChain9Ex.GetDisplayModeEx)
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode.
     * @param {Pointer<D3DDISPLAYROTATION>} pRotation Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a> indicating the type of screen rotation the application will do. The value returned through this pointer is important when the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresentflag">D3DPRESENTFLAG_NOAUTOROTATE</a> flag is used; otherwise, it can be set to <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9ex-getdisplaymodeex
     */
    GetDisplayModeEx(pMode, pRotation) {
        pRotationMarshal := pRotation is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, D3DDISPLAYMODEEX.Ptr, pMode, pRotationMarshal, pRotation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3DSwapChain9Ex.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLastPresentCount := CallbackCreate(GetMethod(implObj, "GetLastPresentCount"), flags, 2)
        this.vtbl.GetPresentStats := CallbackCreate(GetMethod(implObj, "GetPresentStats"), flags, 2)
        this.vtbl.GetDisplayModeEx := CallbackCreate(GetMethod(implObj, "GetDisplayModeEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLastPresentCount)
        CallbackFree(this.vtbl.GetPresentStats)
        CallbackFree(this.vtbl.GetDisplayModeEx)
    }
}
