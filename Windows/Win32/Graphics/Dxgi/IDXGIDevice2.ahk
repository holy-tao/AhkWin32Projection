#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice1.ahk

/**
 * The IDXGIDevice2 interface implements a derived class for DXGI objects that produce image data. The interface exposes methods to block CPU processing until the GPU completes processing, and to offer resources to the operating system.
 * @remarks
 * The <b>IDXGIDevice2</b> interface is designed for use by DXGI objects that need access to other DXGI objects. This interface is useful to
 *           applications that do not use Direct3D to communicate with DXGI.
 *         
 * 
 * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
 *           corresponding <b>IDXGIDevice2</b> interface. To retrieve the <b>IDXGIDevice2</b>  interface of a Direct3D device, use the following code:
 *         
 * 
 * 
 * ```
 * IDXGIDevice2 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice2), (void **)&pDXGIDevice);
 * 
 * ```
 * 
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nn-dxgi1_2-idxgidevice2
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice2 extends IDXGIDevice1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDevice2
     * @type {Guid}
     */
    static IID => Guid("{05008617-fbfd-4051-a790-144884b4f6a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OfferResources", "ReclaimResources", "EnqueueSetEvent"]

    /**
     * Allows the operating system to free the video memory of resources by discarding their content. (IDXGIDevice2.OfferResources)
     * @remarks
     * The priority value that the  <i>Priority</i> parameter specifies describes how valuable the caller considers the content to be.  The operating system uses the priority value to discard resources in order of priority. The operating system discards a resource that is offered with low priority before it discards a resource that is  offered with a higher priority.
     * 
     * If you call <b>OfferResources</b> to offer a resource while the resource is bound to the pipeline, the resource is unbound.  You cannot call <b>OfferResources</b> on a resource that is mapped.  After you offer a resource, the resource cannot be mapped or bound to the pipeline until you call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources">IDXGIDevice2::ReclaimResource</a> method to reclaim the resource. You cannot call <b>OfferResources</b> to offer immutable resources.
     * 
     * To offer shared resources, call <b>OfferResources</b> on only one of the sharing devices.  To ensure exclusive access to the resources, you must use an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgikeyedmutex">IDXGIKeyedMutex</a> object and then call <b>OfferResources</b> only while you hold the mutex. In fact, you can't offer shared resources unless you use <b>IDXGIKeyedMutex</b> because offering shared resources without using <b>IDXGIKeyedMutex</b> isn't supported.
     * 
     * <div class="alert"><b>Note</b>  The user mode display driver might not immediately offer the resources that you specified in a call to <b>OfferResources</b>. The driver can postpone offering them until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">ID3D11DeviceContext::Flush</a>. </div>
     * <div> </div>
     * <b>Platform Update for Windows 7:  </b>The runtime validates that <b>OfferResources</b> is used correctly on non-shared resources but doesn't perform the intended functionality. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @param {Integer} NumResources The number of resources in the <i>ppResources</i> argument array.
     * @param {Pointer<IDXGIResource>} ppResources An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to offer.
     * @param {Integer} Priority_ A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_offer_resource_priority">DXGI_OFFER_RESOURCE_PRIORITY</a>-typed value that indicates how valuable data is.
     * @returns {HRESULT} <b>OfferResources</b> returns:
     *             
     *           
     * 
     * <ul>
     * <li>S_OK if resources were successfully offered</li>
     * <li>E_INVALIDARG if a resource in the array or the priority is invalid</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources
     */
    OfferResources(NumResources, ppResources, Priority_) {
        result := ComCall(14, this, "uint", NumResources, "ptr*", ppResources, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Restores access to resources that were previously offered by calling IDXGIDevice2::OfferResources.
     * @remarks
     * After you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">IDXGIDevice2::OfferResources</a> to offer one or more resources, you must call <b>ReclaimResources</b> before you can use those resources again.  You must check the values in the array at <i>pDiscarded</i> to determine whether each resource’s content was discarded. If a resource’s content was discarded while it was offered, its current content is undefined. Therefore, you must overwrite the resource’s content before you use the resource.
     * 
     * To reclaim shared resources, call <b>ReclaimResources</b> only on one of the sharing devices.  To ensure exclusive access to the resources, you must use an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgikeyedmutex">IDXGIKeyedMutex</a> object and then call <b>ReclaimResources</b> only while you hold the mutex.
     * 
     * <b>Platform Update for Windows 7:  </b>The runtime validates that <b>ReclaimResources</b> is used correctly on non-shared resources but doesn't perform the intended functionality. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @param {Integer} NumResources The number of resources in the <i>ppResources</i> argument and <i>pDiscarded</i> argument arrays.
     * @param {Pointer<IDXGIResource>} ppResources An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to reclaim.
     * @returns {BOOL} A pointer to an array that receives Boolean values. Each value in the array corresponds to a resource at the same index that the <i>ppResources</i> parameter specifies.  The runtime sets each Boolean value to TRUE if the corresponding resource’s content was discarded and is now undefined, or to FALSE if the corresponding resource’s old content is still intact.  The caller can pass in <b>NULL</b>, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources
     */
    ReclaimResources(NumResources, ppResources) {
        result := ComCall(15, this, "uint", NumResources, "ptr*", ppResources, "int*", &pDiscarded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDiscarded
    }

    /**
     * Flushes any outstanding rendering commands and sets the specified event object to the signaled state after all previously submitted rendering commands complete.
     * @remarks
     * <b>EnqueueSetEvent</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setevent">SetEvent</a> function on the event object after all previously submitted rendering commands complete or the device is removed.
     * 
     * After an application calls <b>EnqueueSetEvent</b>, it  can immediately call the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitforsingleobject">WaitForSingleObject</a> function to put itself to sleep until rendering commands complete.
     * 
     * You cannot use <b>EnqueueSetEvent</b> to determine work completion that is associated with presentation (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>); instead, we recommend that you use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getframestatistics">IDXGISwapChain::GetFrameStatistics</a>.
     * @param {HANDLE} hEvent A handle to the event object. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle. All types of event objects (manual-reset, auto-reset, and so on) are supported.
     * 
     * The handle must have the EVENT_MODIFY_STATE access right. For more information about access rights, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise, returns one of the following values:
     * 
     * <ul>
     * <li><b>E_OUTOFMEMORY</b> if insufficient memory is available to complete the operation.</li>
     * <li><b>E_INVALIDARG</b> if the parameter was validated and determined to be incorrect.</li>
     * </ul>
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>EnqueueSetEvent</b> fails with E_NOTIMPL. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgidevice2-enqueuesetevent
     */
    EnqueueSetEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(16, this, "ptr", hEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
