#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FILTERING_TYPE.ahk" { FILTERING_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Mediates filter negotiation between a destination provider and a source provider.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ifilterrequestcallback
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFilterRequestCallback extends IUnknown {
    /**
     * The interface identifier for IFilterRequestCallback
     * @type {Guid}
     */
    static IID := Guid("{82df8873-6360-463a-a8a1-ede5e1a1594d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterRequestCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterRequestCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests that the filter that is specified by the destination provider be used by the source provider during change enumeration.
     * @remarks
     * Filter negotiation is achieved by using the following steps:
     * 
     * <ol>
     * <li>Before the source provider begins enumerating changes, starts filter negotiation by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-irequestfilteredsync-specifyfilter">IRequestFilteredSync::SpecifyFilter</a> on the destination provider.</li>
     * <li>During processing of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-irequestfilteredsync-specifyfilter">IRequestFilteredSync::SpecifyFilter</a>, the destination provider passes filters to <b>IFilterRequestCallback::RequestFilter</b>.</li>
     * <li>During processing of <b>IFilterRequestCallback::RequestFilter</b>, calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportfilteredsync-addfilter">ISupportFilteredSync::AddFilter</a> on the source provider. If the source provider does not support the requested filter, the destination provider can continue to request filters until it finds one that is supported.</li>
     * </ol>
     * When a filter has been successfully negotiated, the source provider uses it to determine which items to include during change enumeration.
     * @param {IUnknown} pFilter The filter that is specified by the destination provider. This filter is passed to the source provider to be used during change enumeration.
     * @param {FILTERING_TYPE} filteringType A <a href="https://docs.microsoft.com/windows/win32/api/winsync/ne-winsync-filtering_type">FILTERING_TYPE</a> enumeration value that indicates the type of information that is included in a change batch during filtered synchronization.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_FILTER_NOT_SUPPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the filter that is specified by <i>pFilter</i> is not supported by the source provider. This is also returned when the source provider does not implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isupportfilteredsync">ISupportFilteredSync</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifilterrequestcallback-requestfilter
     */
    RequestFilter(pFilter, filteringType) {
        result := ComCall(3, this, "ptr", pFilter, FILTERING_TYPE, filteringType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterRequestCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestFilter := CallbackCreate(GetMethod(implObj, "RequestFilter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestFilter)
    }
}
