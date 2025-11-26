#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a synchronization provider that is able to report the date and time when an item or change unit was last changed. This ability is useful to an application that implements last-writer-wins conflict resolution.
 * @remarks
 * 
 * This interface is typically implemented by a provider. If a provider implements this interface, it must return a pointer to it when <b>IID_ISupportLastWriteTime</b> is passed to the <b>QueryInterface</b> method of its data transfer interface. The data transfer interface is the interface that a provider returns in response to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynchronousdataretriever-loadchangedata">ISynchronousDataRetriever::LoadChangeData</a> method.
 * 
 * To implement last-writer-wins conflict resolution, an application typically performs the following steps:
 * 
 * <ol>
 * <li>Registers an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynccallback">ISyncCallback</a> object to receive conflict notifications.</li>
 * <li>In the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onconflict">ISyncCallback::OnConflict</a> method, calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingdata">IChangeConflict::GetDestinationProviderConflictingData</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingdata">IChangeConflict::GetSourceProviderConflictingData</a> on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-ichangeconflict">IChangeConflict</a> object to get the data transfer interfaces for the conflicting changes.</li>
 * <li>Passes <b>IID_ISupportLastWriteTime</b> to the <b>QueryInterface</b> method of each data transfer interface to get the <b>ISupportLastWriteTime</b> objects that represent the conflicting changes.</li>
 * <li>Calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportlastwritetime-getitemchangetime">GetItemChangeTime</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isupportlastwritetime-getchangeunitchangetime">GetChangeUnitChangeTime</a> on the <b>ISupportLastWriteTime</b> objects to get the last date and time the changes were made.</li>
 * <li>Compares the date and time values to determine which change was made last.</li>
 * <li>Indicates which change to keep by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchange">IChangeConflict::SetResolveActionForChange</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchangeunit">IChangeConflict::SetResolveActionForChangeUnit</a> method.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isupportlastwritetime
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISupportLastWriteTime extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportLastWriteTime
     * @type {Guid}
     */
    static IID => Guid("{eadf816f-d0bd-43ca-8f40-5acdc6c06f7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemChangeTime", "GetChangeUnitChangeTime"]

    /**
     * Gets the date and time when the specified item was last changed.
     * @param {Pointer<Integer>} pbItemId The ID of the item to look up.
     * @param {Pointer<Integer>} pullTimestamp The date and time when the specified item was last changed.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isupportlastwritetime-getitemchangetime
     */
    GetItemChangeTime(pbItemId, pullTimestamp) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pullTimestampMarshal := pullTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbItemIdMarshal, pbItemId, pullTimestampMarshal, pullTimestamp, "HRESULT")
        return result
    }

    /**
     * Gets the date and time when the specified change unit was last changed.
     * @param {Pointer<Integer>} pbItemId The ID of the item that contains the change unit to look up.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to look up.
     * @param {Pointer<Integer>} pullTimestamp The date and time when the specified change unit was last changed.
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
     * <dt><b>Provider-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isupportlastwritetime-getchangeunitchangetime
     */
    GetChangeUnitChangeTime(pbItemId, pbChangeUnitId, pullTimestamp) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        pullTimestampMarshal := pullTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, pullTimestampMarshal, pullTimestamp, "HRESULT")
        return result
    }
}
