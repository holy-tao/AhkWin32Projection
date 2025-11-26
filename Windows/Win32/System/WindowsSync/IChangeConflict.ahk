#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a conflict between two items.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ichangeconflict
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IChangeConflict extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChangeConflict
     * @type {Guid}
     */
    static IID => Guid("{014ebf97-9f20-4f7a-bdd4-25979c77c002}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDestinationProviderConflictingChange", "GetSourceProviderConflictingChange", "GetDestinationProviderConflictingData", "GetSourceProviderConflictingData", "GetResolveActionForChange", "SetResolveActionForChange", "GetResolveActionForChangeUnit", "SetResolveActionForChangeUnit"]

    /**
     * Gets the change metadata from the destination provider.
     * @returns {ISyncChange} Returns the change metadata from the destination provider.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingchange
     */
    GetDestinationProviderConflictingChange() {
        result := ComCall(3, this, "ptr*", &ppConflictingChange := 0, "HRESULT")
        return ISyncChange(ppConflictingChange)
    }

    /**
     * Gets the change metadata from the source provider.
     * @returns {ISyncChange} Returns the change metadata from the source provider.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingchange
     */
    GetSourceProviderConflictingChange() {
        result := ComCall(4, this, "ptr*", &ppConflictingChange := 0, "HRESULT")
        return ISyncChange(ppConflictingChange)
    }

    /**
     * Gets an object that can be used to retrieve item data for the change item from the destination replica.
     * @returns {IUnknown} Returns an object that can be used to retrieve item data for the change item from the destination replica.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingdata
     */
    GetDestinationProviderConflictingData() {
        result := ComCall(5, this, "ptr*", &ppConflictingData := 0, "HRESULT")
        return IUnknown(ppConflictingData)
    }

    /**
     * Gets an object that can be used to retrieve item data for the change item from the source replica.
     * @returns {IUnknown} Returns an object that can be used to retrieve item data for the change item from the source replica.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingdata
     */
    GetSourceProviderConflictingData() {
        result := ComCall(6, this, "ptr*", &ppConflictingData := 0, "HRESULT")
        return IUnknown(ppConflictingData)
    }

    /**
     * Gets the conflict resolution action for the conflict.
     * @param {Pointer<Integer>} pResolveAction Returns the conflict resolution action for the conflict.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-getresolveactionforchange
     */
    GetResolveActionForChange(pResolveAction) {
        pResolveActionMarshal := pResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pResolveActionMarshal, pResolveAction, "HRESULT")
        return result
    }

    /**
     * Sets a conflict resolution action for the conflict.
     * @param {Integer} resolveAction The conflict resolution action for the conflict.
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
     * <dt><b>SYNC_E_INTERNAL_ERROR </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-setresolveactionforchange
     */
    SetResolveActionForChange(resolveAction) {
        result := ComCall(8, this, "int", resolveAction, "HRESULT")
        return result
    }

    /**
     * Gets the conflict resolution action for the conflicting change unit change.
     * @param {ISyncChangeUnit} pChangeUnit The change unit for which to retrieve the conflict resolution action.
     * @param {Pointer<Integer>} pResolveAction The conflict resolution action that is specified for <i>pChangeUnit</i>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-getresolveactionforchangeunit
     */
    GetResolveActionForChangeUnit(pChangeUnit, pResolveAction) {
        pResolveActionMarshal := pResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", pChangeUnit, pResolveActionMarshal, pResolveAction, "HRESULT")
        return result
    }

    /**
     * Sets a conflict resolution action for the conflicting change unit change.
     * @param {ISyncChangeUnit} pChangeUnit The change unit for which to set the conflict resolution action.
     * @param {Integer} resolveAction The conflict resolution action to set for <i>pChangeUnit</i>.
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
     * <dt><b>SYNC_E_INTERNAL_ERROR </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the conflict is an update-delete conflict, or when no conflict exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeconflict-setresolveactionforchangeunit
     */
    SetResolveActionForChangeUnit(pChangeUnit, resolveAction) {
        result := ComCall(10, this, "ptr", pChangeUnit, "int", resolveAction, "HRESULT")
        return result
    }
}
