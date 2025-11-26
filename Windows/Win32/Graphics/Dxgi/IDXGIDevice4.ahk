#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice3.ahk

/**
 * This interface provides updated methods to offer and reclaim resources.
 * @remarks
 * 
 * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
 *           corresponding <b>IDXGIDevice4</b> interface. To retrieve the <b>IDXGIDevice4</b>  interface of a Direct3D device, use the following code:
 *         
 * 
 * 
 * ```cpp
 * IDXGIDevice4 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice4), (void **)&pDXGIDevice);
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nn-dxgi1_5-idxgidevice4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice4 extends IDXGIDevice3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDevice4
     * @type {Guid}
     */
    static IID => Guid("{95b4f95f-d8da-4ca4-9ee6-3b76d5968a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OfferResources1", "ReclaimResources1"]

    /**
     * Allows the operating system to free the video memory of resources, including both discarding the content and de-committing the memory.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * The number of resources in the <i>ppResources</i> argument array.
     * @param {Pointer<IDXGIResource>} ppResources Type: <b>IDXGIResource*</b>
     * 
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to offer.
     * @param {Integer} Priority Type: <b>DXGI_OFFER_RESOURCE_PRIORITY</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_offer_resource_priority">DXGI_OFFER_RESOURCE_PRIORITY</a>-typed value that indicates how valuable data is.
     * @param {Integer} Flags Type: <b>UINT</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_offer_resource_flags">DXGI_OFFER_RESOURCE_FLAGS</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code, which can include E_INVALIDARG if a resource in the array, or the priority, is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nf-dxgi1_5-idxgidevice4-offerresources1
     */
    OfferResources1(NumResources, ppResources, Priority, Flags) {
        result := ComCall(18, this, "uint", NumResources, "ptr*", ppResources, "int", Priority, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Restores access to resources that were previously offered by calling IDXGIDevice4::OfferResources1.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * The number of resources in the <i>ppResources</i> argument and <i>pResults</i> argument arrays.
     * @param {Pointer<IDXGIResource>} ppResources Type: <b>IDXGIResource*</b>
     * 
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to reclaim.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results">DXGI_RECLAIM_RESOURCE_RESULTS</a>*</b>
     * 
     * A pointer to an array that receives <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results">DXGI_RECLAIM_RESOURCE_RESULTS</a> values. Each value in the array corresponds to a resource at the same index that the <i>ppResources</i> parameter specifies.  The caller can pass in <b>NULL</b>, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nf-dxgi1_5-idxgidevice4-reclaimresources1
     */
    ReclaimResources1(NumResources, ppResources) {
        result := ComCall(19, this, "uint", NumResources, "ptr*", ppResources, "int*", &pResults := 0, "HRESULT")
        return pResults
    }
}
