#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10DepthStencilView.ahk" { ID3D10DepthStencilView }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }

/**
 * A depth-stencil-view-variable interface accesses a depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectdepthstencilviewvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectDepthStencilViewVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectDepthStencilViewVariable
     * @type {Guid}
     */
    static IID := Guid("{3e02c918-cc79-4985-b622-2d92ad701623}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectDepthStencilViewVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        SetDepthStencil      : IntPtr
        GetDepthStencil      : IntPtr
        SetDepthStencilArray : IntPtr
        GetDepthStencilArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectDepthStencilViewVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a depth-stencil-view resource.
     * @param {ID3D10DepthStencilView} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>*</b>
     * 
     * A pointer to a depth-stencil-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView Interface</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-setdepthstencil
     */
    SetDepthStencil(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * Get a depth-stencil-view resource.
     * @returns {ID3D10DepthStencilView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>**</b>
     * 
     * The address of a pointer to a depth-stencil-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-getdepthstencil
     */
    GetDepthStencil() {
        result := ComCall(26, this, "ptr*", &ppResource := 0, "HRESULT")
        return ID3D10DepthStencilView(ppResource)
    }

    /**
     * Set an array of depth-stencil-view resources.
     * @param {Pointer<ID3D10DepthStencilView>} ppResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>**</b>
     * 
     * A pointer to an array of depth-stencil-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView Interface</a>.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to set the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-setdepthstencilarray
     */
    SetDepthStencilArray(ppResources, Offset, Count) {
        result := ComCall(27, this, ID3D10DepthStencilView.Ptr, ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of depth-stencil-view resources.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to get the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {ID3D10DepthStencilView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView</a>**</b>
     * 
     * A pointer to an array of depth-stencil-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilview">ID3D10DepthStencilView Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilviewvariable-getdepthstencilarray
     */
    GetDepthStencilArray(Offset, Count) {
        result := ComCall(28, this, "ptr*", &ppResources := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ID3D10DepthStencilView(ppResources)
    }

    Query(iid) {
        if (ID3D10EffectDepthStencilViewVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDepthStencil := CallbackCreate(GetMethod(implObj, "SetDepthStencil"), flags, 2)
        this.vtbl.GetDepthStencil := CallbackCreate(GetMethod(implObj, "GetDepthStencil"), flags, 2)
        this.vtbl.SetDepthStencilArray := CallbackCreate(GetMethod(implObj, "SetDepthStencilArray"), flags, 4)
        this.vtbl.GetDepthStencilArray := CallbackCreate(GetMethod(implObj, "GetDepthStencilArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDepthStencil)
        CallbackFree(this.vtbl.GetDepthStencil)
        CallbackFree(this.vtbl.SetDepthStencilArray)
        CallbackFree(this.vtbl.GetDepthStencilArray)
    }
}
