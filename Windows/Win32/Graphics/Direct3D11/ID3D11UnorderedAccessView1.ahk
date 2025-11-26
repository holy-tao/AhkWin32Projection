#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11UnorderedAccessView.ahk

/**
 * An unordered-access-view interface represents the parts of a resource the pipeline can access during rendering.
 * @remarks
 * 
 * To create a view for an unordered access resource, call  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createunorderedaccessview1">ID3D11Device3::CreateUnorderedAccessView1</a>.
 * 
 * All resources must be bound to the pipeline before they can be accessed. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetunorderedaccessviews">ID3D11DeviceContext::CSSetUnorderedAccessViews</a> to bind an unordered access view to a compute shader; call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargetsandunorderedaccessviews">ID3D11DeviceContext::OMSetRenderTargetsAndUnorderedAccessViews</a> to bind an unordered access view to a pixel shader.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11unorderedaccessview1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11UnorderedAccessView1 extends ID3D11UnorderedAccessView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11UnorderedAccessView1
     * @type {Guid}
     */
    static IID => Guid("{7b3b6153-a886-4544-ab37-6537c8500403}")

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
     * Gets a description of the resource.
     * @param {Pointer<D3D11_UNORDERED_ACCESS_VIEW_DESC1>} pDesc1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_unordered_access_view_desc1">D3D11_UNORDERED_ACCESS_VIEW_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_unordered_access_view_desc1">D3D11_UNORDERED_ACCESS_VIEW_DESC1</a> structure that receives the description of the unordered-access resource.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11unorderedaccessview1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, "ptr", pDesc1)
    }
}
