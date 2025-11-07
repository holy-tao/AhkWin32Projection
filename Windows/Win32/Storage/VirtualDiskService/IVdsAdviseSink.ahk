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
     * 
     * @param {Integer} lNumberOfNotifications 
     * @param {Pointer<VDS_NOTIFICATION>} pNotificationArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsadvisesink-onnotify
     */
    OnNotify(lNumberOfNotifications, pNotificationArray) {
        result := ComCall(3, this, "int", lNumberOfNotifications, "ptr", pNotificationArray, "HRESULT")
        return result
    }
}
