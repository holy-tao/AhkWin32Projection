#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateSession2.ahk" { IUpdateSession2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateServiceManager2.ahk" { IUpdateServiceManager2 }
#Import ".\IUpdateHistoryEntryCollection.ahk" { IUpdateHistoryEntryCollection }

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation. (IUpdateSession3)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatesession3
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateSession3 extends IUpdateSession2 {
    /**
     * The interface identifier for IUpdateSession3
     * @type {Guid}
     */
    static IID := Guid("{918efd1e-b5d8-4c90-8540-aeb9bdc56f9d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateSession3 interfaces
    */
    struct Vtbl extends IUpdateSession2.Vtbl {
        CreateUpdateServiceManager : IntPtr
        QueryHistory               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateSession3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a pointer to an IUpdateServiceManager2 interface for the session.
     * @returns {IUpdateServiceManager2} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservicemanager2">IUpdateServiceManager2</a> interface for the session.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession3-createupdateservicemanager
     */
    CreateUpdateServiceManager() {
        result := ComCall(17, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateServiceManager2(retval)
    }

    /**
     * Synchronously queries the computer for the history of update events.
     * @remarks
     * The collection of events that is returned is sorted by the date in descending order.
     * 
     * The string that is used for  the <i>criteria</i> parameter must match the custom search language for <b>QueryHistory</b>. The string contains criteria that are evaluated to determine which history events to return.
     * 
     * Note that <b>QueryHistory</b> supports per-machine updates only.
     * 
     * For a complete description of search criteria syntax, see <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-search">Search</a>. 
     * 
     * The following table identifies all the public support criteria, in the order of evaluation precedence. More criteria may be added to this list in the future.
     * 
     * <table>
     * <tr>
     * <th>Criterion</th>
     * <th>Type</th>
     * <th>Allowed operators</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>UpdateID</td>
     * <td><b>string(UUID)</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates that have an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_updateid">UpdateIdentity.UpdateID</a> of the specified value. 
     * 
     * For example, "UpdateID='12345678-9abc-def0-1234-56789abcdef0'" finds updates for <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_updateid">UpdateIdentity.UpdateID</a> that equal 12345678-9abc-def0-1234-56789abcdef0.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} criteria A string that specifies the search criteria.
     * @param {Integer} startIndex The index of the first event to retrieve.
     * @param {Integer} count The number of events to retrieve.
     * @returns {IUpdateHistoryEntryCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentrycollection">IUpdateHistoryEntryCollection</a> interface that contains the matching event records on the computer in descending chronological order.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession3-queryhistory
     */
    QueryHistory(criteria, startIndex, count) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(18, this, BSTR, criteria, "int", startIndex, "int", count, "ptr*", &retval := 0, "HRESULT")
        return IUpdateHistoryEntryCollection(retval)
    }

    Query(iid) {
        if (IUpdateSession3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateUpdateServiceManager := CallbackCreate(GetMethod(implObj, "CreateUpdateServiceManager"), flags, 2)
        this.vtbl.QueryHistory := CallbackCreate(GetMethod(implObj, "QueryHistory"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateUpdateServiceManager)
        CallbackFree(this.vtbl.QueryHistory)
    }
}
