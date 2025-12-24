#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates the data sent in a notification channel.
 * @remarks
 * 
 * Listening applications must call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata">ReleaseData</a> when they have finished consuming the notification data obtained with <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata">AcquireData</a>.
 * 
 * The <b>IPrintAsyncNotifyDataObject</b> interface must be implemented in a way that ensures that a call of <a href="https://docs.microsoft.com/previous-versions/dd757102(v=vs.85)">IUnknown::Release</a> does not free the object if a listening application has not finished consuming the object's data. Accordingly, if a call to <b>Release</b> occurs when an application has called <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata">AcquireData</a> but has not yet called <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata">ReleaseData</a> , then the object must not be freed. For this reason, we recommend that <b>AcquireData</b> use <a href="https://docs.microsoft.com/previous-versions/dd757100(v=vs.85)">IUnknown::AddRef</a> to increment the object's reference count and that <b>ReleaseData</b> decrement the count.
 * 
 * Listening applications can live within the Print Spooler's process as well as outside it. When the listener is outside of this process, it can access only the <b>IPrintAsyncNotifyDataObject</b> methods. Hence, if your <b>IPrintAsyncNotifyDataObject</b> also implements an interface of your own, be aware that your interface's methods are available only to listening applications within the Print Spooler's process.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nn-prnasnot-iprintasyncnotifydataobject
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotifyDataObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotifyDataObject
     * @type {Guid}
     */
    static IID => Guid("{77cf513e-5d49-4789-9f30-d0822b335c0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireData", "ReleaseData"]

    /**
     * Directs listening applications to the notification data, including the data's size and type.
     * @param {Pointer<Pointer<Integer>>} ppNotificationData A buffer containing the notification data.
     * @param {Pointer<Integer>} pSize The size of the data buffer.
     * @param {Pointer<Pointer<Guid>>} ppSchema A GUID pointer to the data schema.
     * @returns {HRESULT} See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for the possible values.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-iprintasyncnotifydataobject-acquiredata
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
     * @returns {HRESULT} See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for the possible values.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-iprintasyncnotifydataobject-releasedata
     */
    ReleaseData() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
