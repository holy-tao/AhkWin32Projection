#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11RasterizerState1.ahk

/**
 * The rasterizer-state interface holds a description for rasterizer state that you can bind to the rasterizer stage. This rasterizer-state interface supports forced sample count and conservative rasterization mode.
 * @remarks
 * 
 * To create a rasterizer-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrasterizerstate2">ID3D11Device3::CreateRasterizerState2</a>. To bind the rasterizer-state object to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage">rasterizer stage</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetstate">ID3D11DeviceContext::RSSetState</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11rasterizerstate2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11RasterizerState2 extends ID3D11RasterizerState1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11RasterizerState2
     * @type {Guid}
     */
    static IID => Guid("{6fbd02fb-209f-46c4-b059-2ed15586a6ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc2"]

    /**
     * Gets the description for rasterizer state that you used to create the rasterizer-state object.
     * @remarks
     * 
     * You use the description for rasterizer state in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrasterizerstate2">ID3D11Device3::CreateRasterizerState2</a> method to create the rasterizer-state object.
     * 
     * 
     * @param {Pointer<D3D11_RASTERIZER_DESC2>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_rasterizer_desc2">D3D11_RASTERIZER_DESC2</a> structure that receives a description of the rasterizer state. This rasterizer state can specify forced sample count and conservative rasterization mode.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11rasterizerstate2-getdesc2
     */
    GetDesc2(pDesc) {
        ComCall(9, this, "ptr", pDesc)
    }
}
