#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFilterRequestCallback.ahk" { IFilterRequestCallback }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * When implemented by a derived class, represents a destination provider that can specify a filter to be used by the source provider during change enumeration.
 * @remarks
 * Typically, <b>IRequestFilteredSync</b> is implemented by a destination provider.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-irequestfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IRequestFilteredSync extends IUnknown {
    /**
     * The interface identifier for IRequestFilteredSync
     * @type {Guid}
     */
    static IID := Guid("{2e020184-6d18-46a7-a32a-da4aeb06696c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRequestFilteredSync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SpecifyFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRequestFilteredSync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * When implemented by a derived class, negotiates which filter is used by the source provider during change enumeration.
     * @remarks
     * Filter negotiation is achieved by using the following steps:
     * 
     * <ol>
     * <li>Before the source provider begins enumerating changes, a synchronization session typically starts filter negotiation by calling <b>IRequestFilteredSync::SpecifyFilter</b> on the destination provider.</li>
     * <li>During processing of <b>IRequestFilteredSync::SpecifyFilter</b>, the destination provider passes filters to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IFilterRequestCallback::RequestFilter</a>.</li>
     * <li>During processing of <b>IFilterRequestCallback::RequestFilter</b>, a synchronization session typically calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> on the source provider. If the source provider does not support the requested filter, the destination provider can continue to request filters until it finds one that is supported.</li>
     * </ol>
     * When a filter has been successfully negotiated, the source provider uses it to determine which items to include during change enumeration.
     * 
     * <div class="alert"><b>Note</b>  An implementation of this method can repeatedly call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter">IFilterRequestCallback::RequestFilter</a> until a filter is found that is supported by both the destination provider and the source provider. The source provider indicates that it does not support a filter by returning <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_FILTER_NOT_SUPPORTED</a> in response to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> call.
     * 
     * <p class="note">When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> returns an error other than <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/windows-sync-error-codes">SYNC_E_FILTER_NOT_SUPPORTED</a>, <b>IRequestFilteredSync::SpecifyFilter</b> should return the error to the Sync Application. This ends the synchronization session.
     * 
     * </div>
     * <div> </div>
     * @param {IFilterRequestCallback} pCallback The callback interface that is used by the destination provider to request that a filter be used by the source provider during change enumeration.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irequestfilteredsync-specifyfilter
     */
    SpecifyFilter(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRequestFilteredSync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SpecifyFilter := CallbackCreate(GetMethod(implObj, "SpecifyFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SpecifyFilter)
    }
}
