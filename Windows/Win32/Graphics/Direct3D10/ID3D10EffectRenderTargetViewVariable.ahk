#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10RenderTargetView.ahk" { ID3D10RenderTargetView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }

/**
 * A render-target-view interface accesses a render target.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectrendertargetviewvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectRenderTargetViewVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectRenderTargetViewVariable
     * @type {Guid}
     */
    static IID := Guid("{28ca0cc3-c2c9-40bb-b57f-67b737122b17}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectRenderTargetViewVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        SetRenderTarget      : IntPtr
        GetRenderTarget      : IntPtr
        SetRenderTargetArray : IntPtr
        GetRenderTargetArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectRenderTargetViewVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a render-target.
     * @param {ID3D10RenderTargetView} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>*</b>
     * 
     * A pointer to a render-target-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-setrendertarget
     */
    SetRenderTarget(pResource) {
        result := ComCall(25, this, "ptr", pResource, "HRESULT")
        return result
    }

    /**
     * Get a render-target.
     * @returns {ID3D10RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * The address of a pointer to a render-target-view interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-getrendertarget
     */
    GetRenderTarget() {
        result := ComCall(26, this, "ptr*", &ppResource := 0, "HRESULT")
        return ID3D10RenderTargetView(ppResource)
    }

    /**
     * Set an array of render-targets.
     * @param {Pointer<ID3D10RenderTargetView>} ppResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * Set an array of render-target-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to store the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-setrendertargetarray
     */
    SetRenderTargetArray(ppResources, Offset, Count) {
        result := ComCall(27, this, ID3D10RenderTargetView.Ptr, ppResources, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of render-targets.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based array index to get the first interface.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the array.
     * @returns {ID3D10RenderTargetView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView</a>**</b>
     * 
     * A pointer to an array of render-target-view interfaces. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rendertargetview">ID3D10RenderTargetView Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrendertargetviewvariable-getrendertargetarray
     */
    GetRenderTargetArray(Offset, Count) {
        result := ComCall(28, this, "ptr*", &ppResources := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ID3D10RenderTargetView(ppResources)
    }

    Query(iid) {
        if (ID3D10EffectRenderTargetViewVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRenderTarget := CallbackCreate(GetMethod(implObj, "SetRenderTarget"), flags, 2)
        this.vtbl.GetRenderTarget := CallbackCreate(GetMethod(implObj, "GetRenderTarget"), flags, 2)
        this.vtbl.SetRenderTargetArray := CallbackCreate(GetMethod(implObj, "SetRenderTargetArray"), flags, 4)
        this.vtbl.GetRenderTargetArray := CallbackCreate(GetMethod(implObj, "GetRenderTargetArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRenderTarget)
        CallbackFree(this.vtbl.GetRenderTarget)
        CallbackFree(this.vtbl.SetRenderTargetArray)
        CallbackFree(this.vtbl.GetRenderTargetArray)
    }
}
