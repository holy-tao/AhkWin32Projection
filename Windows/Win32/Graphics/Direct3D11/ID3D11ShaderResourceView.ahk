#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_SHADER_RESOURCE_VIEW_DESC.ahk" { D3D11_SHADER_RESOURCE_VIEW_DESC }
#Import ".\ID3D11View.ahk" { ID3D11View }

/**
 * A shader-resource-view interface specifies the subresources a shader can access during rendering. Examples of shader resources include a constant buffer, a texture buffer, and a texture.
 * @remarks
 * To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.
 * 
 * A shader-resource view is required when binding a resource to a shader stage; the binding occurs by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources">ID3D11DeviceContext::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">ID3D11DeviceContext::VSSetShaderResources</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources">ID3D11DeviceContext::PSSetShaderResources</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11shaderresourceview
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ShaderResourceView extends ID3D11View {
    /**
     * The interface identifier for ID3D11ShaderResourceView
     * @type {Guid}
     */
    static IID := Guid("{b0e06fe0-8192-4e1a-b1ca-36d7414710b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ShaderResourceView interfaces
    */
    struct Vtbl extends ID3D11View.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ShaderResourceView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the shader resource view's description. (ID3D11ShaderResourceView.GetDesc)
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a> structure to be filled with data about the shader resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11shaderresourceview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_SHADER_RESOURCE_VIEW_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11ShaderResourceView.IID.Equals(iid)) {
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
