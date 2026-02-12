#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateServiceManager2.ahk
#Include .\IUpdateHistoryEntryCollection.ahk
#Include .\IUpdateSession2.ahk

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation. (IUpdateSession3)
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iupdatesession3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSession3 extends IUpdateSession2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSession3
     * @type {Guid}
     */
    static IID => Guid("{918efd1e-b5d8-4c90-8540-aeb9bdc56f9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUpdateServiceManager", "QueryHistory"]

    /**
     * Returns a pointer to an IUpdateServiceManager2 interface for the session.
     * @returns {IUpdateServiceManager2} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservicemanager2">IUpdateServiceManager2</a> interface for the session.
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdatesession3-createupdateservicemanager
     */
    CreateUpdateServiceManager() {
        result := ComCall(17, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdatesession3-queryhistory
     */
    QueryHistory(criteria, startIndex, count) {
        if(criteria is String) {
            pin := BSTR.Alloc(criteria)
            criteria := pin.Value
        }

        result := ComCall(18, this, "ptr", criteria, "int", startIndex, "int", count, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUpdateHistoryEntryCollection(retval)
    }
}
