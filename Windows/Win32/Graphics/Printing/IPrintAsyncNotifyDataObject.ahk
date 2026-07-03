#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Encapsulates the data sent in a notification channel.
 * @remarks
 * Listening applications must call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata">ReleaseData</a> when they have finished consuming the notification data obtained with <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata">AcquireData</a>.
 * 
 * The <b>IPrintAsyncNotifyDataObject</b> interface must be implemented in a way that ensures that a call of <a href="https://docs.microsoft.com/previous-versions/dd757102(v=vs.85)">IUnknown::Release</a> does not free the object if a listening application has not finished consuming the object's data. Accordingly, if a call to <b>Release</b> occurs when an application has called <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata">AcquireData</a> but has not yet called <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata">ReleaseData</a> , then the object must not be freed. For this reason, we recommend that <b>AcquireData</b> use <a href="https://docs.microsoft.com/previous-versions/dd757100(v=vs.85)">IUnknown::AddRef</a> to increment the object's reference count and that <b>ReleaseData</b> decrement the count.
 * 
 * Listening applications can live within the Print Spooler's process as well as outside it. When the listener is outside of this process, it can access only the <b>IPrintAsyncNotifyDataObject</b> methods. Hence, if your <b>IPrintAsyncNotifyDataObject</b> also implements an interface of your own, be aware that your interface's methods are available only to listening applications within the Print Spooler's process.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nn-prnasnot-iprintasyncnotifydataobject
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintAsyncNotifyDataObject extends IUnknown {
    /**
     * The interface identifier for IPrintAsyncNotifyDataObject
     * @type {Guid}
     */
    static IID := Guid("{77cf513e-5d49-4789-9f30-d0822b335c0d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintAsyncNotifyDataObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AcquireData : IntPtr
        ReleaseData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintAsyncNotifyDataObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Directs listening applications to the notification data, including the data's size and type.
     * @remarks
     * Applications that call this method must call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata">ReleaseData</a> when they have finished consuming the notification data.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifydataobject">IPrintAsyncNotifyDataObject</a> interface must be implemented to ensure that a call of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> does not free the object if a listening application has not finished consuming the object's data. Accordingly, if a call to <b>Release</b> occurs when an application has called <b>AcquireData</b> but has not yet called <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata">ReleaseData</a> , then the object must not be freed. For this reason, we recommend that <b>AcquireData</b> use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> to increment the object's reference count and that <b>ReleaseData</b> decrement the count.
     * 
     * When the Print Spooler fails, it creates an <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifydataobject">IPrintAsyncNotifyDataObject</a> object. When a listener calls <b>AcquireData</b> for this notification, <i>ppNotificationData</i> is <b>NULL</b>, the size is 0, and <i>ppSchema</i> is NOTIFICATION_RELEASE.
     * @param {Pointer<Pointer<Integer>>} ppNotificationData A buffer containing the notification data.
     * @param {Pointer<Integer>} pSize The size of the data buffer.
     * @param {Pointer<Pointer<Guid>>} ppSchema A GUID pointer to the data schema.
     * @returns {HRESULT} See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for the possible values.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata
     */
    AcquireData(ppNotificationData, pSize, ppSchema) {
        ppNotificationDataMarshal := ppNotificationData is VarRef ? "ptr*" : "ptr"
        pSizeMarshal := pSize is VarRef ? "uint*" : "ptr"
        ppSchemaMarshal := ppSchema is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppNotificationDataMarshal, ppNotificationData, pSizeMarshal, pSize, ppSchemaMarshal, ppSchema, "HRESULT")
        return result
    }

    /**
     * Releases the memory used by the data encapsulated in IPrintAsyncNotifyDataObject.
     * @remarks
     * Listening applications must call this method when they have finished consuming the notification data.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifydataobject">IPrintAsyncNotifyDataObject</a> interface must be implemented in a way that ensures that a call of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> does not free the object if a listening application has not finished consuming the object's data. Accordingly, if a call to <b>Release</b> occurs when an application has called <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata">AcquireData</a> but has not yet called <b>ReleaseData</b>, then the object must not be freed. For this reason, we recommend that <b>AcquireData</b> use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> to increment the object's reference count, and that <b>ReleaseData</b> decrement the count.
     * @returns {HRESULT} See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for the possible values.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata
     */
    ReleaseData() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintAsyncNotifyDataObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireData := CallbackCreate(GetMethod(implObj, "AcquireData"), flags, 4)
        this.vtbl.ReleaseData := CallbackCreate(GetMethod(implObj, "ReleaseData"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireData)
        CallbackFree(this.vtbl.ReleaseData)
    }
}
