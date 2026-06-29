#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_SHADER_RESOURCE_VIEW_DESC1.ahk" { D3D11_SHADER_RESOURCE_VIEW_DESC1 }
#Import ".\ID3D11ShaderResourceView.ahk" { ID3D11ShaderResourceView }

/**
 * A shader-resource-view interface represents the subresources a shader can access during rendering. Examples of shader resources include a constant buffer, a texture buffer, and a texture.
 * @remarks
 * To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a>.
 * 
 * A shader-resource view is required when binding a resource to a shader stage; the binding occurs by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources">ID3D11DeviceContext::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">ID3D11DeviceContext::VSSetShaderResources</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources">ID3D11DeviceContext::PSSetShaderResources</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11shaderresourceview1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11ShaderResourceView1 extends ID3D11ShaderResourceView {
    /**
     * The interface identifier for ID3D11ShaderResourceView1
     * @type {Guid}
     */
    static IID := Guid("{91308b87-9040-411d-8c67-c39253ce3802}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11ShaderResourceView1 interfaces
    */
    struct Vtbl extends ID3D11ShaderResourceView.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11ShaderResourceView1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the shader-resource view's description.
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC1>} pDesc1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_shader_resource_view_desc1">D3D11_SHADER_RESOURCE_VIEW_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_shader_resource_view_desc1">D3D11_SHADER_RESOURCE_VIEW_DESC1</a> structure that receives the description of the shader-resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11shaderresourceview1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, D3D11_SHADER_RESOURCE_VIEW_DESC1.Ptr, pDesc1)
    }

    Query(iid) {
        if (ID3D11ShaderResourceView1.IID.Equals(iid)) {
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
