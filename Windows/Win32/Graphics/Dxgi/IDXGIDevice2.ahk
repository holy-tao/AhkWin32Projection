#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice1.ahk

/**
 * The IDXGIDevice2 interface implements a derived class for DXGI objects that produce image data. The interface exposes methods to block CPU processing until the GPU completes processing, and to offer resources to the operating system.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgidevice2
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
     * Allows the operating system to free the video memory of resources by discarding their content.
     * @param {Integer} NumResources The number of resources in the <i>ppResources</i> argument array.
     * @param {Pointer<IDXGIResource>} ppResources An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to offer.
     * @param {Integer} Priority A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_offer_resource_priority">DXGI_OFFER_RESOURCE_PRIORITY</a>-typed value that indicates how valuable data is.
     * @returns {HRESULT} <b>OfferResources</b> returns:
     *             
     *           
     * 
     * <ul>
     * <li>S_OK if resources were successfully offered</li>
     * <li>E_INVALIDARG if a resource in the array or the priority is invalid</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources
     */
    OfferResources(NumResources, ppResources, Priority) {
        result := ComCall(14, this, "uint", NumResources, "ptr*", ppResources, "int", Priority, "HRESULT")
        return result
    }

    /**
     * Restores access to resources that were previously offered by calling IDXGIDevice2::OfferResources.
     * @param {Integer} NumResources The number of resources in the <i>ppResources</i> argument and <i>pDiscarded</i> argument arrays.
     * @param {Pointer<IDXGIResource>} ppResources An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces for the resources to reclaim.
     * @returns {BOOL} A pointer to an array that receives Boolean values. Each value in the array corresponds to a resource at the same index that the <i>ppResources</i> parameter specifies.  The runtime sets each Boolean value to TRUE if the corresponding resource’s content was discarded and is now undefined, or to FALSE if the corresponding resource’s old content is still intact.  The caller can pass in <b>NULL</b>, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources
     */
    ReclaimResources(NumResources, ppResources) {
        result := ComCall(15, this, "uint", NumResources, "ptr*", ppResources, "int*", &pDiscarded := 0, "HRESULT")
        return pDiscarded
    }

    /**
     * Flushes any outstanding rendering commands and sets the specified event object to the signaled state after all previously submitted rendering commands complete.
     * @param {HANDLE} hEvent A handle to the event object. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle. All types of event objects (manual-reset, auto-reset, and so on) are supported.
     * 
     * The handle must have the EVENT_MODIFY_STATE access right. For more information about access rights, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise, returns one of the following values:
     * 
     * <ul>
     * <li><b>E_OUTOFMEMORY</b> if insufficient memory is available to complete the operation.</li>
     * <li><b>E_INVALIDARG</b> if the parameter was validated and determined to be incorrect.</li>
     * </ul>
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>EnqueueSetEvent</b> fails with E_NOTIMPL. For more info about the Platform Update for Windows 7, see <a href="/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgidevice2-enqueuesetevent
     */
    EnqueueSetEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(16, this, "ptr", hEvent, "HRESULT")
        return result
    }
}
