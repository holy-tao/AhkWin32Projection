#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents application callbacks that are used to notify the application of synchronization events.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isynccallback
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncCallback
     * @type {Guid}
     */
    static IID => Guid("{0599797f-5ed9-485c-ae36-0c5d1bf2e7a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnProgress", "OnChange", "OnConflict", "OnFullEnumerationNeeded", "OnRecoverableError"]

    /**
     * Occurs periodically during the synchronization session to report progress.
     * @param {Integer} provider The role of the provider that is associated with this event.
     * @param {Integer} syncStage The current stage of the synchronization session.
     * @param {Integer} dwCompletedWork The amount of work that is currently completed in the session. This value is interpreted as being a part of <i>dwTotalWork</i>.
     * @param {Integer} dwTotalWork The total work for the session.
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
     * <dt><b>Application-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback-onprogress
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(3, this, "int", provider, "int", syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "HRESULT")
        return result
    }

    /**
     * Occurs before a change is applied.
     * @param {ISyncChange} pSyncChange The item change that is about to be applied.
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
     * <dt><b>Application-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback-onchange
     */
    OnChange(pSyncChange) {
        result := ComCall(4, this, "ptr", pSyncChange, "HRESULT")
        return result
    }

    /**
     * Occurs when a conflict is detected when the concurrency conflict resolution policy is set to CRP_NONE.
     * @param {IChangeConflict} pConflict Information about the conflict. This includes metadata and item data for the two changes that are in conflict.
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
     * <dt><b>Application-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback-onconflict
     */
    OnConflict(pConflict) {
        result := ComCall(5, this, "ptr", pConflict, "HRESULT")
        return result
    }

    /**
     * Occurs when the forgotten knowledge from the source provider is not contained in the current knowledge of the destination provider.
     * @param {Pointer<Integer>} pFullEnumerationAction Specifies how a synchronization session should handle the full enumeration.
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
     * <dt><b>Application-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback-onfullenumerationneeded
     */
    OnFullEnumerationNeeded(pFullEnumerationAction) {
        pFullEnumerationActionMarshal := pFullEnumerationAction is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pFullEnumerationActionMarshal, pFullEnumerationAction, "HRESULT")
        return result
    }

    /**
     * Occurs when a synchronization provider sets a recoverable error when it is loading or saving an item.
     * @param {IRecoverableError} pRecoverableError The recoverable error.
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
     * <dt><b>Application-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isynccallback-onrecoverableerror
     */
    OnRecoverableError(pRecoverableError) {
        result := ComCall(7, this, "ptr", pRecoverableError, "HRESULT")
        return result
    }
}
