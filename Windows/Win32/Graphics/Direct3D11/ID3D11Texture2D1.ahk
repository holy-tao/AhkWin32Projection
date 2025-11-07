#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Texture2D.ahk

/**
 * A 2D texture interface represents texel data, which is structured memory.
 * @remarks
 * 
 * To create an empty Texture2D resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createtexture2d1">ID3D11Device3::CreateTexture2D1</a>. For info about how to create a 2D texture, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-textures-create">How to: Create a Texture</a>. 
 * 
 * Textures can't be bound directly to the pipeline; instead, a view must be created and bound. Using a view, texture data can be interpreted at run time within certain restrictions. To use the texture as a render-target or depth-stencil resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1">ID3D11Device3::CreateRenderTargetView1</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview">ID3D11Device::CreateDepthStencilView</a>, respectively. To use the texture as an input to a shader, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11texture2d1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Texture2D1 extends ID3D11Texture2D{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Texture2D1
     * @type {Guid}
     */
    static IID => Guid("{51218251-1e33-4617-9ccb-4d3a4367e7bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1"]

    /**
     * 
     * @param {Pointer<D3D11_TEXTURE2D_DESC1>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11texture2d1-getdesc1
     */
    GetDesc1(pDesc) {
        ComCall(11, this, "ptr", pDesc)
    }
}
