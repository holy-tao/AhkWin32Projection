#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10ShaderResourceView.ahk

/**
 * A shader-resource-view interface specifies the subresources a shader can access during rendering. Examples of shader resources include a constant buffer, a texture buffer, a texture or a sampler.
 * @remarks
 * 
  * To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-id3d10device1-createshaderresourceview1">ID3D10Device1::CreateShaderResourceView1</a>.
  * 
  * A shader-resource view is required when binding a resource to a shader stage; the binding occurs by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetshaderresources">ID3D10Device::GSSetShaderResources</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources">ID3D10Device::VSSetShaderResources</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshaderresources">ID3D10Device::PSSetShaderResources</a>.
  * 
  * This method requires Windows Vista Service Pack 1.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nn-d3d10_1-id3d10shaderresourceview1
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderResourceView1 extends ID3D10ShaderResourceView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10ShaderResourceView1
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c87-342c-4106-a19f-4f2704f689f0}")

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
     * @param {Pointer<D3D10_SHADER_RESOURCE_VIEW_DESC1>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-id3d10shaderresourceview1-getdesc1
     */
    GetDesc1(pDesc) {
        ComCall(9, this, "ptr", pDesc)
    }
}
