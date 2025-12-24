#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives VDS notifications.
 * @remarks
 * 
 * VDS registers an <b>IVdsAdviseSink</b> interface with 
 *     providers by calling the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload">IVdsProviderPrivate::OnLoad</a> method 
 *     implemented by the provider.
 * 
 * After implementing the <b>IVdsAdviseSink</b> 
 *       interface, an application must register the interface with VDS to receive notifications. To register, call the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a>method and pass a pointer to the <b>IVdsAdviseSink</b> 
 *       interface. To unregister the <b>IVdsAdviseSink</b> interface and stop receiving notifications, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-unadvise">IVdsService::Unadvise</a> method.<div class="alert"><b>Note</b>  An application that calls <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">Advise</a> must eventually call <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-unadvise">Unadvise</a>. Ideally, it should call <b>Unadvise</b> as soon as it no longer needs to receive notifications.</div>
 * <div> </div>
 * 
 * 
 * You do not specify a notification type or an object type when you register an application for notifications. 
 *      Rather, you register to receive all VDS notifications of all types and from all providers.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsadvisesink
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdviseSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAdviseSink
     * @type {Guid}
     */
    static IID => Guid("{8326cd1d-cf59-4936-b786-5efc08798e25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNotify"]

    /**
     * Passes notifications from providers to VDS, and from VDS to applications.
     * @param {Integer} lNumberOfNotifications The number of notifications specified in <i>pNotificationArray</i>.
     * @param {Pointer<VDS_NOTIFICATION>} pNotificationArray A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> 
     *       structures. A provider allocates the memory for the array when the provider calls into the service; the 
     *       service frees the array. VDS allocates the array when the service calls into an application. In this case, 
     *       callers must free the array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS returns this value to a provider if the service is not fully initialized when the provider calls into 
     *         this method, or if some notifications are lost by the service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvisesink-onnotify
     */
    OnNotify(lNumberOfNotifications, pNotificationArray) {
        result := ComCall(3, this, "int", lNumberOfNotifications, "ptr", pNotificationArray, "HRESULT")
        return result
    }
}
