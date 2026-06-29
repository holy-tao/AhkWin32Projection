#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncChangeUnit.ahk" { ISyncChangeUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNC_RESOLVE_ACTION.ahk" { SYNC_RESOLVE_ACTION }

/**
 * Represents a conflict between two items.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ichangeconflict
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IChangeConflict extends IUnknown {
    /**
     * The interface identifier for IChangeConflict
     * @type {Guid}
     */
    static IID := Guid("{014ebf97-9f20-4f7a-bdd4-25979c77c002}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChangeConflict interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDestinationProviderConflictingChange : IntPtr
        GetSourceProviderConflictingChange      : IntPtr
        GetDestinationProviderConflictingData   : IntPtr
        GetSourceProviderConflictingData        : IntPtr
        GetResolveActionForChange               : IntPtr
        SetResolveActionForChange               : IntPtr
        GetResolveActionForChangeUnit           : IntPtr
        SetResolveActionForChangeUnit           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChangeConflict.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the change metadata from the destination provider.
     * @returns {ISyncChange} Returns the change metadata from the destination provider.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingchange
     */
    GetDestinationProviderConflictingChange() {
        result := ComCall(3, this, "ptr*", &ppConflictingChange := 0, "HRESULT")
        return ISyncChange(ppConflictingChange)
    }

    /**
     * Gets the change metadata from the source provider.
     * @returns {ISyncChange} Returns the change metadata from the source provider.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingchange
     */
    GetSourceProviderConflictingChange() {
        result := ComCall(4, this, "ptr*", &ppConflictingChange := 0, "HRESULT")
        return ISyncChange(ppConflictingChange)
    }

    /**
     * Gets an object that can be used to retrieve item data for the change item from the destination replica.
     * @remarks
     * The object that is returned in <i>ppConflictingData</i> can be an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynchronousdataretriever">ISynchronousDataRetriever</a> object or a provider-specific object.
     * @returns {IUnknown} Returns an object that can be used to retrieve item data for the change item from the destination replica.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getdestinationproviderconflictingdata
     */
    GetDestinationProviderConflictingData() {
        result := ComCall(5, this, "ptr*", &ppConflictingData := 0, "HRESULT")
        return IUnknown(ppConflictingData)
    }

    /**
     * Gets an object that can be used to retrieve item data for the change item from the source replica.
     * @remarks
     * The object that is returned in <i>ppConflictingData</i> can be an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynchronousdataretriever">ISynchronousDataRetriever</a> object or a provider-specific object.
     * @returns {IUnknown} Returns an object that can be used to retrieve item data for the change item from the source replica.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getsourceproviderconflictingdata
     */
    GetSourceProviderConflictingData() {
        result := ComCall(6, this, "ptr*", &ppConflictingData := 0, "HRESULT")
        return IUnknown(ppConflictingData)
    }

    /**
     * Gets the conflict resolution action for the conflict.
     * @param {Pointer<SYNC_RESOLVE_ACTION>} pResolveAction Returns the conflict resolution action for the conflict.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getresolveactionforchange
     */
    GetResolveActionForChange(pResolveAction) {
        pResolveActionMarshal := pResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pResolveActionMarshal, pResolveAction, "HRESULT")
        return result
    }

    /**
     * Sets a conflict resolution action for the conflict.
     * @remarks
     * By setting this action in an event handler for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onconflict">ISyncCallback::OnConflict</a>, the event handler specifies how a change applier should handle the conflict.
     * @param {SYNC_RESOLVE_ACTION} resolveAction The conflict resolution action for the conflict.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchange
     */
    SetResolveActionForChange(resolveAction) {
        result := ComCall(8, this, SYNC_RESOLVE_ACTION, resolveAction, "HRESULT")
        return result
    }

    /**
     * Gets the conflict resolution action for the conflicting change unit change.
     * @param {ISyncChangeUnit} pChangeUnit The change unit for which to retrieve the conflict resolution action.
     * @param {Pointer<SYNC_RESOLVE_ACTION>} pResolveAction The conflict resolution action that is specified for <i>pChangeUnit</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-getresolveactionforchangeunit
     */
    GetResolveActionForChangeUnit(pChangeUnit, pResolveAction) {
        pResolveActionMarshal := pResolveAction is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", pChangeUnit, pResolveActionMarshal, pResolveAction, "HRESULT")
        return result
    }

    /**
     * Sets a conflict resolution action for the conflicting change unit change.
     * @remarks
     * Be aware that setting the conflict resolution action for a change unit on an update-delete conflict is not valid, because this type of conflict must be resolved at the item level.
     * 
     * By setting this action in an event handler for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onconflict">ISyncCallback::OnConflict</a>, the event handler specifies how the change applier should handle the conflict.
     * @param {ISyncChangeUnit} pChangeUnit The change unit for which to set the conflict resolution action.
     * @param {SYNC_RESOLVE_ACTION} resolveAction The conflict resolution action to set for <i>pChangeUnit</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchangeunit
     */
    SetResolveActionForChangeUnit(pChangeUnit, resolveAction) {
        result := ComCall(10, this, "ptr", pChangeUnit, SYNC_RESOLVE_ACTION, resolveAction, "HRESULT")
        return result
    }

    Query(iid) {
        if (IChangeConflict.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDestinationProviderConflictingChange := CallbackCreate(GetMethod(implObj, "GetDestinationProviderConflictingChange"), flags, 2)
        this.vtbl.GetSourceProviderConflictingChange := CallbackCreate(GetMethod(implObj, "GetSourceProviderConflictingChange"), flags, 2)
        this.vtbl.GetDestinationProviderConflictingData := CallbackCreate(GetMethod(implObj, "GetDestinationProviderConflictingData"), flags, 2)
        this.vtbl.GetSourceProviderConflictingData := CallbackCreate(GetMethod(implObj, "GetSourceProviderConflictingData"), flags, 2)
        this.vtbl.GetResolveActionForChange := CallbackCreate(GetMethod(implObj, "GetResolveActionForChange"), flags, 2)
        this.vtbl.SetResolveActionForChange := CallbackCreate(GetMethod(implObj, "SetResolveActionForChange"), flags, 2)
        this.vtbl.GetResolveActionForChangeUnit := CallbackCreate(GetMethod(implObj, "GetResolveActionForChangeUnit"), flags, 3)
        this.vtbl.SetResolveActionForChangeUnit := CallbackCreate(GetMethod(implObj, "SetResolveActionForChangeUnit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDestinationProviderConflictingChange)
        CallbackFree(this.vtbl.GetSourceProviderConflictingChange)
        CallbackFree(this.vtbl.GetDestinationProviderConflictingData)
        CallbackFree(this.vtbl.GetSourceProviderConflictingData)
        CallbackFree(this.vtbl.GetResolveActionForChange)
        CallbackFree(this.vtbl.SetResolveActionForChange)
        CallbackFree(this.vtbl.GetResolveActionForChangeUnit)
        CallbackFree(this.vtbl.SetResolveActionForChangeUnit)
    }
}
