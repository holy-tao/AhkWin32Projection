#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11UnorderedAccessView.ahk" { ID3D11UnorderedAccessView }
#Import ".\D3D11_UNORDERED_ACCESS_VIEW_DESC1.ahk" { D3D11_UNORDERED_ACCESS_VIEW_DESC1 }

/**
 * An unordered-access-view interface represents the parts of a resource the pipeline can access during rendering.
 * @remarks
 * To create a view for an unordered access resource, call  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createunorderedaccessview1">ID3D11Device3::CreateUnorderedAccessView1</a>.
 * 
 * All resources must be bound to the pipeline before they can be accessed. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetunorderedaccessviews">ID3D11DeviceContext::CSSetUnorderedAccessViews</a> to bind an unordered access view to a compute shader; call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargetsandunorderedaccessviews">ID3D11DeviceContext::OMSetRenderTargetsAndUnorderedAccessViews</a> to bind an unordered access view to a pixel shader.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11unorderedaccessview1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11UnorderedAccessView1 extends ID3D11UnorderedAccessView {
    /**
     * The interface identifier for ID3D11UnorderedAccessView1
     * @type {Guid}
     */
    static IID := Guid("{7b3b6153-a886-4544-ab37-6537c8500403}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11UnorderedAccessView1 interfaces
    */
    struct Vtbl extends ID3D11UnorderedAccessView.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11UnorderedAccessView1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a description of the resource.
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC1>} pDesc1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_unordered_access_view_desc1">D3D11_UNORDERED_ACCESS_VIEW_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_unordered_access_view_desc1">D3D11_UNORDERED_ACCESS_VIEW_DESC1</a> structure that receives the description of the unordered-access resource.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11unorderedaccessview1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, D3D11_UNORDERED_ACCESS_VIEW_DESC1.Ptr, pDesc1)
    }

    Query(iid) {
        if (ID3D11UnorderedAccessView1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc1 := CallbackCreate(GetMethod(implObj, "GetDesc1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc1)
    }
}
