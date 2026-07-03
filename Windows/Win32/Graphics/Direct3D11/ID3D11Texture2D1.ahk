#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_TEXTURE2D_DESC1.ahk" { D3D11_TEXTURE2D_DESC1 }
#Import ".\ID3D11Texture2D.ahk" { ID3D11Texture2D }

/**
 * A 2D texture interface represents texel data, which is structured memory.
 * @remarks
 * To create an empty Texture2D resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createtexture2d1">ID3D11Device3::CreateTexture2D1</a>. For info about how to create a 2D texture, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-textures-create">How to: Create a Texture</a>. 
 * 
 * Textures can't be bound directly to the pipeline; instead, a view must be created and bound. Using a view, texture data can be interpreted at run time within certain restrictions. To use the texture as a render-target or depth-stencil resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1">ID3D11Device3::CreateRenderTargetView1</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview">ID3D11Device::CreateDepthStencilView</a>, respectively. To use the texture as an input to a shader, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11texture2d1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Texture2D1 extends ID3D11Texture2D {
    /**
     * The interface identifier for ID3D11Texture2D1
     * @type {Guid}
     */
    static IID := Guid("{51218251-1e33-4617-9ccb-4d3a4367e7bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Texture2D1 interfaces
    */
    struct Vtbl extends ID3D11Texture2D.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Texture2D1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the properties of the texture resource. (ID3D11Texture2D1.GetDesc1)
     * @param {Pointer<D3D11_TEXTURE2D_DESC1>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_texture2d_desc1">D3D11_TEXTURE2D_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_texture2d_desc1">D3D11_TEXTURE2D_DESC1</a> structure that receives the description of the 2D texture.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11texture2d1-getdesc1
     */
    GetDesc1(pDesc) {
        ComCall(11, this, D3D11_TEXTURE2D_DESC1.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11Texture2D1.IID.Equals(iid)) {
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
