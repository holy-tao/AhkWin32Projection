#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SYNC_FULL_ENUMERATION_ACTION.ahk" { SYNC_FULL_ENUMERATION_ACTION }
#Import ".\SYNC_PROGRESS_STAGE.ahk" { SYNC_PROGRESS_STAGE }
#Import ".\SYNC_PROVIDER_ROLE.ahk" { SYNC_PROVIDER_ROLE }
#Import ".\IRecoverableError.ahk" { IRecoverableError }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import ".\IChangeConflict.ahk" { IChangeConflict }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents application callbacks that are used to notify the application of synchronization events.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isynccallback
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncCallback extends IUnknown {
    /**
     * The interface identifier for ISyncCallback
     * @type {Guid}
     */
    static IID := Guid("{0599797f-5ed9-485c-ae36-0c5d1bf2e7a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnProgress              : IntPtr
        OnChange                : IntPtr
        OnConflict              : IntPtr
        OnFullEnumerationNeeded : IntPtr
        OnRecoverableError      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Occurs periodically during the synchronization session to report progress.
     * @remarks
     * Exactly when <b>OnProgress</b> is sent and with what values depends on the providers.
     * @param {SYNC_PROVIDER_ROLE} provider The role of the provider that is associated with this event.
     * @param {SYNC_PROGRESS_STAGE} syncStage The current stage of the synchronization session.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onprogress
     */
    OnProgress(provider, syncStage, dwCompletedWork, dwTotalWork) {
        result := ComCall(3, this, SYNC_PROVIDER_ROLE, provider, SYNC_PROGRESS_STAGE, syncStage, "uint", dwCompletedWork, "uint", dwTotalWork, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onchange
     */
    OnChange(pSyncChange) {
        result := ComCall(4, this, "ptr", pSyncChange, "HRESULT")
        return result
    }

    /**
     * Occurs when a conflict is detected when the concurrency conflict resolution policy is set to CRP_NONE.
     * @remarks
     * This notification can be used by an application to perform custom conflict resolution for concurrency conflicts. To accomplish this, the application inspects and processes the contents of <i>pConflict</i>, and then sets the resolution action for the conflict by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-ichangeconflict">IChangeConflict::SetResolveActionForChange</a> before it returns from this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onconflict
     */
    OnConflict(pConflict) {
        result := ComCall(5, this, "ptr", pConflict, "HRESULT")
        return result
    }

    /**
     * Occurs when the forgotten knowledge from the source provider is not contained in the current knowledge of the destination provider.
     * @remarks
     * By default, if an application callback is not registered to receive this notification, Windows Sync uses <b>SFEA_ABORT</b>.
     * @param {Pointer<SYNC_FULL_ENUMERATION_ACTION>} pFullEnumerationAction Specifies how a synchronization session should handle the full enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onfullenumerationneeded
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback-onrecoverableerror
     */
    OnRecoverableError(pRecoverableError) {
        result := ComCall(7, this, "ptr", pRecoverableError, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 5)
        this.vtbl.OnChange := CallbackCreate(GetMethod(implObj, "OnChange"), flags, 2)
        this.vtbl.OnConflict := CallbackCreate(GetMethod(implObj, "OnConflict"), flags, 2)
        this.vtbl.OnFullEnumerationNeeded := CallbackCreate(GetMethod(implObj, "OnFullEnumerationNeeded"), flags, 2)
        this.vtbl.OnRecoverableError := CallbackCreate(GetMethod(implObj, "OnRecoverableError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnProgress)
        CallbackFree(this.vtbl.OnChange)
        CallbackFree(this.vtbl.OnConflict)
        CallbackFree(this.vtbl.OnFullEnumerationNeeded)
        CallbackFree(this.vtbl.OnRecoverableError)
    }
}
