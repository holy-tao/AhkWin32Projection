#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11RenderTargetView.ahk

/**
 * A render-target-view interface represents the render-target subresources that can be accessed during rendering.
 * @remarks
 * 
  * To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1">ID3D11Device3::CreateRenderTargetView1</a>. To bind a render-target view to the pipeline, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.
  * 
  * A render target is a resource that can be written by the output-merger stage at the end of a render pass. Each render target can also have a corresponding depth-stencil view.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11rendertargetview1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11RenderTargetView1 extends ID3D11RenderTargetView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11RenderTargetView1
     * @type {Guid}
     */
    static IID => Guid("{ffbe2e23-f011-418a-ac56-5ceed7c5b94b}")

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
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC1>} pDesc1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11rendertargetview1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, "ptr", pDesc1)
    }
}
