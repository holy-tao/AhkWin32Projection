#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_NOTIFICATION.ahk" { VDS_NOTIFICATION }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsAdviseSink (vdshwprv.h) interface receives VDS notifications.
 * @remarks
 * VDS registers an <b>IVdsAdviseSink</b> interface with 
 *     providers by calling the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload">IVdsProviderPrivate::OnLoad</a> method 
 *     implemented by the provider.
 * 
 * After implementing the <b>IVdsAdviseSink</b> 
 *       interface, an application must register the interface with VDS to receive notifications. To register, call the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method and pass a pointer to the <b>IVdsAdviseSink</b> 
 *       interface. To unregister the <b>IVdsAdviseSink</b> interface and stop receiving notifications, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-unadvise">IVdsService::Unadvise</a> method.<div class="alert"><b>Note</b>  An application that calls <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">Advise</a> must eventually call <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-unadvise">Unadvise</a>. Ideally, it should call <b>Unadvise</b> as soon as it no longer needs to receive notifications.</div>
 * <div> </div>
 * 
 * 
 * You do not specify a notification type or an object type when you register an application for notifications. 
 *      Rather, you register to receive all VDS notifications of all types and from all providers.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsadvisesink
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsAdviseSink extends IUnknown {
    /**
     * The interface identifier for IVdsAdviseSink
     * @type {Guid}
     */
    static IID := Guid("{8326cd1d-cf59-4936-b786-5efc08798e25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsAdviseSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsAdviseSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsAdviseSink::OnNotify method (vdshwprv.h) passes notifications from providers to VDS, and from VDS to applications.
     * @remarks
     * An application implements this method to receive notifications from VDS. Some of these notifications originate from VDS; others are provider notifications that are forwarded by VDS.
     * 
     * VDS maintains a cache of information about the properties of all VDS objects, such as subsystems and controllers. Whenever a change occurs that triggers a notification, this cache is updated automatically. Also, calling <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-refresh">IVdsService::Refresh</a> in response to a VDS notification could cause an endless loop of notifications to be sent. For these reasons, an application should not call <b>IVdsHwProvider::Refresh</b> or <b>IVdsService::Refresh</b> in its implementation of this method. 
     * 
     * For providers that use this method to send notifications, it is good practice to group notifications originating from a single event together. For example, when a LUN 
     *     is deleted, send <b>VDS_NF_DRIVE_MODIFY</b> notifications for all affected drives 
     *     together.
     * @param {Integer} lNumberOfNotifications The number of notifications specified in <i>pNotificationArray</i>.
     * @param {Pointer<VDS_NOTIFICATION>} pNotificationArray A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_notification">VDS_NOTIFICATION</a> 
     *       structures. A provider allocates the memory for the array when the provider calls into the service; the 
     *       service frees the array. VDS allocates the array when the service calls into an application. In this case, 
     *       callers must free the array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsadvisesink-onnotify
     */
    OnNotify(lNumberOfNotifications, pNotificationArray) {
        result := ComCall(3, this, "int", lNumberOfNotifications, VDS_NOTIFICATION.Ptr, pNotificationArray, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsAdviseSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNotify := CallbackCreate(GetMethod(implObj, "OnNotify"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNotify)
    }
}
