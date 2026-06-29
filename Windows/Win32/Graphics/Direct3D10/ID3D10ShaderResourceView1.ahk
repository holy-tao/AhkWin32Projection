#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D10_SHADER_RESOURCE_VIEW_DESC1.ahk" { D3D10_SHADER_RESOURCE_VIEW_DESC1 }
#Import ".\ID3D10ShaderResourceView.ahk" { ID3D10ShaderResourceView }

/**
 * A shader-resource-view interface specifies the subresources a shader can access during rendering. Examples of shader resources include a constant buffer, a texture buffer, a texture or a sampler. (ID3D10ShaderResourceView1)
 * @remarks
 * To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-id3d10device1-createshaderresourceview1">ID3D10Device1::CreateShaderResourceView1</a>.
 * 
 * A shader-resource view is required when binding a resource to a shader stage; the binding occurs by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetshaderresources">ID3D10Device::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources">ID3D10Device::VSSetShaderResources</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshaderresources">ID3D10Device::PSSetShaderResources</a>.
 * 
 * This method requires Windows Vista Service Pack 1.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nn-d3d10_1-id3d10shaderresourceview1
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10ShaderResourceView1 extends ID3D10ShaderResourceView {
    /**
     * The interface identifier for ID3D10ShaderResourceView1
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c87-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10ShaderResourceView1 interfaces
    */
    struct Vtbl extends ID3D10ShaderResourceView.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10ShaderResourceView1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the shader resource view's description. (ID3D10ShaderResourceView1.GetDesc1)
     * @remarks
     * This method requires Windows Vista Service Pack 1.
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC1>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_shader_resource_view_desc1">D3D10_SHADER_RESOURCE_VIEW_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ns-d3d10_1-d3d10_shader_resource_view_desc1">D3D10_SHADER_RESOURCE_VIEW_DESC1</a> structure to be filled with data about the shader resource view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-id3d10shaderresourceview1-getdesc1
     */
    GetDesc1(pDesc) {
        ComCall(9, this, D3D10_SHADER_RESOURCE_VIEW_DESC1.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10ShaderResourceView1.IID.Equals(iid)) {
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
