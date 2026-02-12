#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice3.ahk

/**
 * This interface provides updated methods to offer and reclaim resources.
 * @remarks
 * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
 *           corresponding <b>IDXGIDevice4</b> interface. To retrieve the <b>IDXGIDevice4</b>  interface of a Direct3D device, use the following code:
 *         
 * 
 * 
 * ```cpp
 * IDXGIDevice4 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice4), (void **)&pDXGIDevice);
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_5/nn-dxgi1_5-idxgidevice4
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
     * @remarks
     * <b>OfferResources1</b> (an extension of the original <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">IDXGIDevice2::OfferResources</a> API) enables D3D based applications to allow de-committing of an allocation’s backing store to reduce system commit under low memory conditions. 
     * A de-committed allocation cannot be reused, so opting in to the new DXGI_OFFER_RESOURCE_FLAG_ALLOW_DECOMMIT flag means the new reclaim results must be properly handled. Refer to the flag descriptions in <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results">DXGI_RECLAIM_RESOURCE_RESULTS</a> and the Example below.
     * 
     * <b>OfferResources1</b> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgidevice4-reclaimresources1">ReclaimResources1</a> may <i>not</i> be used interchangeably with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">OfferResources</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources">ReclaimResources</a>. 
     * 
     * 
     * The priority value that the  <i>Priority</i> parameter specifies describes how valuable the caller considers the content to be.  The operating system uses the priority value to discard resources in order of priority. The operating system discards a resource that is offered with low priority before it discards a resource that is  offered with a higher priority.
     * 
     * If you call <b>OfferResources1</b> to offer a resource while the resource is bound to the pipeline, the resource is unbound.  You cannot call <b>OfferResources1</b> on a resource that is mapped.  After you offer a resource, the resource cannot be mapped or bound to the pipeline until you call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgidevice4-reclaimresources1">ReclaimResources1</a> method to reclaim the resource. You cannot call <b>OfferResources1</b> to offer immutable resources.
     * 
     * To offer shared resources, call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">OfferResources1</a> on only one of the sharing devices.  To ensure exclusive access to the resources, you must use an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgikeyedmutex">IDXGIKeyedMutex</a> object and then call <b>OfferResources1</b> only while you hold the mutex. In fact, you can't offer shared resources unless you use <b>IDXGIKeyedMutex</b> because offering shared resources without using <b>IDXGIKeyedMutex</b> isn't supported.
     * 
     * The user mode display driver might not immediately offer the resources that you specified in a call to <b>OfferResources1</b>. The driver can postpone offering them until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">ID3D11DeviceContext::Flush</a>.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * The number of resources in the <i>ppResources</i> argument array.
     * @param {Pointer<IDXGIResource>} ppResources Type: <b>IDXGIResource*</b>
     * 
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to offer.
     * @param {Integer} Priority_ Type: <b>DXGI_OFFER_RESOURCE_PRIORITY</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_offer_resource_priority">DXGI_OFFER_RESOURCE_PRIORITY</a>-typed value that indicates how valuable data is.
     * @param {Integer} Flags Type: <b>UINT</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_offer_resource_flags">DXGI_OFFER_RESOURCE_FLAGS</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code, which can include E_INVALIDARG if a resource in the array, or the priority, is invalid.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_5/nf-dxgi1_5-idxgidevice4-offerresources1
     */
    OfferResources1(NumResources, ppResources, Priority_, Flags) {
        result := ComCall(18, this, "uint", NumResources, "ptr*", ppResources, "int", Priority_, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Restores access to resources that were previously offered by calling IDXGIDevice4::OfferResources1.
     * @remarks
     * After you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgidevice4-offerresources1">OfferResources1</a> to offer one or more resources, you must call <b>ReclaimResources1</b> before you can use those resources again.
     * 
     * To reclaim shared resources, call <b>ReclaimResources1</b> only on one of the sharing devices.  To ensure exclusive access to the resources, you must use an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgikeyedmutex">IDXGIKeyedMutex</a> object and then call <b>ReclaimResources1</b> only while you hold the mutex.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * The number of resources in the <i>ppResources</i> argument and <i>pResults</i> argument arrays.
     * @param {Pointer<IDXGIResource>} ppResources Type: <b>IDXGIResource*</b>
     * 
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to reclaim.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results">DXGI_RECLAIM_RESOURCE_RESULTS</a>*</b>
     * 
     * A pointer to an array that receives <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results">DXGI_RECLAIM_RESOURCE_RESULTS</a> values. Each value in the array corresponds to a resource at the same index that the <i>ppResources</i> parameter specifies.  The caller can pass in <b>NULL</b>, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_5/nf-dxgi1_5-idxgidevice4-reclaimresources1
     */
    ReclaimResources1(NumResources, ppResources) {
        result := ComCall(19, this, "uint", NumResources, "ptr*", ppResources, "int*", &pResults := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResults
    }
}
