#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_UNORDERED_ACCESS_VIEW_DESC.ahk" { D3D11_UNORDERED_ACCESS_VIEW_DESC }
#Import ".\ID3D11View.ahk" { ID3D11View }

/**
 * A view interface specifies the parts of a resource the pipeline can access during rendering. (ID3D11UnorderedAccessView)
 * @remarks
 * To create a view for an unordered access resource, call  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview">ID3D11Device::CreateUnorderedAccessView</a>.
 * 
 * All resources must be bound to the pipeline before they can be accessed. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetunorderedaccessviews">ID3D11DeviceContext::CSSetUnorderedAccessViews</a> to bind an unordered access view to a compute shader; call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargetsandunorderedaccessviews">ID3D11DeviceContext::OMSetRenderTargetsAndUnorderedAccessViews</a> to bind an unordered access view to a pixel shader.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11unorderedaccessview
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11UnorderedAccessView extends ID3D11View {
    /**
     * The interface identifier for ID3D11UnorderedAccessView
     * @type {Guid}
     */
    static IID := Guid("{28acf509-7f5c-48f6-8611-f316010a6380}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11UnorderedAccessView interfaces
    */
    struct Vtbl extends ID3D11View.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11UnorderedAccessView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a description of the resource.
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>*</b>
     * 
     * Pointer to a resource description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>.)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11unorderedaccessview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_UNORDERED_ACCESS_VIEW_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11UnorderedAccessView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}
