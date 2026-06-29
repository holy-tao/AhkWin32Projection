#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncChangeUnit.ahk" { ISyncChangeUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import ".\IRecoverableErrorData.ahk" { IRecoverableErrorData }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information about a change to be loaded from the item store.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iloadchangecontext
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ILoadChangeContext extends IUnknown {
    /**
     * The interface identifier for ILoadChangeContext
     * @type {Guid}
     */
    static IID := Guid("{44a4aaca-ec39-46d5-b5c9-d633c0ee67e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILoadChangeContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSyncChange                   : IntPtr
        SetRecoverableErrorOnChange     : IntPtr
        SetRecoverableErrorOnChangeUnit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILoadChangeContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the change item for which the change data should be retrieved from the item store.
     * @returns {ISyncChange} Returns the change item for which the change data should be retrieved from the item store.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iloadchangecontext-getsyncchange
     */
    GetSyncChange() {
        result := ComCall(3, this, "ptr*", &ppSyncChange := 0, "HRESULT")
        return ISyncChange(ppSyncChange)
    }

    /**
     * Indicates a recoverable error on this change has occurred.
     * @remarks
     * When this method is called, an <b>ISingleItemException</b> object is added to the learned knowledge; and the item change will not be enumerated again for the duration of the synchronization session.
     * @param {HRESULT} hrError The error code that is associated with the error that prevented the item data from being loaded.
     * @param {IRecoverableErrorData} pErrorData Additional information about the error.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hrError</i> does not specify an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchange
     */
    SetRecoverableErrorOnChange(hrError, pErrorData) {
        result := ComCall(4, this, "int", hrError, "ptr", pErrorData, "HRESULT")
        return result
    }

    /**
     * Indicates that a recoverable error occurred when data for the specified change unit was loaded from the item store.
     * @remarks
     * When this method is called, an <b>IChangeUnitException</b> object is added to the learned knowledge; and the change unit change will not be enumerated again for the duration of the synchronization session.
     * @param {HRESULT} hrError The error code that is associated with the error that prevented the change unit data from being loaded.
     * @param {ISyncChangeUnit} pChangeUnit The change unit change that caused the error.
     * @param {IRecoverableErrorData} pErrorData Additional information about the error.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hrError</i> does not specify an error.
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
     * <dt><b>SYNC_E_ON_CREATE_MUST_FAIL_ENTIRE_ITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change that contains this change unit refers to an item creation. In this case, the error must be reported on the item change by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchange">ILoadChangeContext::SetRecoverableErrorOnChange</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchangeunit
     */
    SetRecoverableErrorOnChangeUnit(hrError, pChangeUnit, pErrorData) {
        result := ComCall(5, this, "int", hrError, "ptr", pChangeUnit, "ptr", pErrorData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILoadChangeContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncChange := CallbackCreate(GetMethod(implObj, "GetSyncChange"), flags, 2)
        this.vtbl.SetRecoverableErrorOnChange := CallbackCreate(GetMethod(implObj, "SetRecoverableErrorOnChange"), flags, 3)
        this.vtbl.SetRecoverableErrorOnChangeUnit := CallbackCreate(GetMethod(implObj, "SetRecoverableErrorOnChangeUnit"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncChange)
        CallbackFree(this.vtbl.SetRecoverableErrorOnChange)
        CallbackFree(this.vtbl.SetRecoverableErrorOnChangeUnit)
    }
}
