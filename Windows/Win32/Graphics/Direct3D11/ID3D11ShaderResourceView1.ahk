#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11ShaderResourceView.ahk

/**
 * A shader-resource-view interface represents the subresources a shader can access during rendering. Examples of shader resources include a constant buffer, a texture buffer, and a texture.
 * @remarks
 * 
  * To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a>.
  * 
  * A shader-resource view is required when binding a resource to a shader stage; the binding occurs by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources">ID3D11DeviceContext::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">ID3D11DeviceContext::VSSetShaderResources</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources">ID3D11DeviceContext::PSSetShaderResources</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11shaderresourceview1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ShaderResourceView1 extends ID3D11ShaderResourceView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ShaderResourceView1
     * @type {Guid}
     */
    static IID => Guid("{91308b87-9040-411d-8c67-c39253ce3802}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1"]

    /**
     * 
     * @param {Pointer<D3D11_SHADER_RESOURCE_VIEW_DESC1>} pDesc1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11shaderresourceview1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, "ptr", pDesc1)
    }
}
