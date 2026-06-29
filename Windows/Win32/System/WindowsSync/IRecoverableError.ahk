#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SYNC_PROGRESS_STAGE.ahk" { SYNC_PROGRESS_STAGE }
#Import ".\SYNC_PROVIDER_ROLE.ahk" { SYNC_PROVIDER_ROLE }
#Import ".\ISyncChangeUnit.ahk" { ISyncChangeUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import ".\IRecoverableErrorData.ahk" { IRecoverableErrorData }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a recoverable error that occurred when an item was loaded or when an item was saved.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-irecoverableerror
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IRecoverableError extends IUnknown {
    /**
     * The interface identifier for IRecoverableError
     * @type {Guid}
     */
    static IID := Guid("{0f5625e8-0a7b-45ee-9637-1ce13645909e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRecoverableError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStage                             : IntPtr
        GetProvider                          : IntPtr
        GetChangeWithRecoverableError        : IntPtr
        GetRecoverableErrorDataForChange     : IntPtr
        GetRecoverableErrorDataForChangeUnit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRecoverableError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the stage in the synchronization session when the error occurred.
     * @param {Pointer<SYNC_PROGRESS_STAGE>} pStage Returns the stage in the synchronization session when the error occurred.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getstage
     */
    GetStage(pStage) {
        pStageMarshal := pStage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStageMarshal, pStage, "HRESULT")
        return result
    }

    /**
     * Gets the role of the provider that skipped the item change.
     * @param {Pointer<SYNC_PROVIDER_ROLE>} pProviderRole Returns the role of the provider that skipped the item change.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getprovider
     */
    GetProvider(pProviderRole) {
        pProviderRoleMarshal := pProviderRole is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pProviderRoleMarshal, pProviderRole, "HRESULT")
        return result
    }

    /**
     * Gets the item change that caused the error.
     * @returns {ISyncChange} Returns the item change that caused the error.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getchangewithrecoverableerror
     */
    GetChangeWithRecoverableError() {
        result := ComCall(5, this, "ptr*", &ppChangeWithRecoverableError := 0, "HRESULT")
        return ISyncChange(ppChangeWithRecoverableError)
    }

    /**
     * Gets additional data about the recoverable error.
     * @param {Pointer<HRESULT>} phrError Returns the error code that is associated with the error that prevented the change unit data from being applied.
     * @returns {IRecoverableErrorData} Returns additional information about the error.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getrecoverableerrordataforchange
     */
    GetRecoverableErrorDataForChange(phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, phrErrorMarshal, phrError, "ptr*", &ppErrorData := 0, "HRESULT")
        return IRecoverableErrorData(ppErrorData)
    }

    /**
     * Gets additional data about the recoverable error for a specified change unit.
     * @param {ISyncChangeUnit} pChangeUnit The change unit that is associated with the error.
     * @param {Pointer<HRESULT>} phrError Returns the error code that is associated with the error that prevented the change unit data from being applied.
     * @returns {IRecoverableErrorData} Returns additional information about the error.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getrecoverableerrordataforchangeunit
     */
    GetRecoverableErrorDataForChangeUnit(pChangeUnit, phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pChangeUnit, phrErrorMarshal, phrError, "ptr*", &ppErrorData := 0, "HRESULT")
        return IRecoverableErrorData(ppErrorData)
    }

    Query(iid) {
        if (IRecoverableError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStage := CallbackCreate(GetMethod(implObj, "GetStage"), flags, 2)
        this.vtbl.GetProvider := CallbackCreate(GetMethod(implObj, "GetProvider"), flags, 2)
        this.vtbl.GetChangeWithRecoverableError := CallbackCreate(GetMethod(implObj, "GetChangeWithRecoverableError"), flags, 2)
        this.vtbl.GetRecoverableErrorDataForChange := CallbackCreate(GetMethod(implObj, "GetRecoverableErrorDataForChange"), flags, 3)
        this.vtbl.GetRecoverableErrorDataForChangeUnit := CallbackCreate(GetMethod(implObj, "GetRecoverableErrorDataForChangeUnit"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStage)
        CallbackFree(this.vtbl.GetProvider)
        CallbackFree(this.vtbl.GetChangeWithRecoverableError)
        CallbackFree(this.vtbl.GetRecoverableErrorDataForChange)
        CallbackFree(this.vtbl.GetRecoverableErrorDataForChangeUnit)
    }
}
