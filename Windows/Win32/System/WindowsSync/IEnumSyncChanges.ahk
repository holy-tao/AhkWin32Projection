#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates a list of item changes.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ienumsyncchanges
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IEnumSyncChanges extends IUnknown {
    /**
     * The interface identifier for IEnumSyncChanges
     * @type {Guid}
     */
    static IID := Guid("{5f86be4a-5e78-4e32-ac1c-c24fd223ef85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSyncChanges interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSyncChanges.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next item change.
     * @param {Integer} cChanges The number of changes to fetch. The only valid value is 1.
     * @param {Pointer<Integer>} pcFetched Returns the number of changes that are fetched.
     * @returns {ISyncChange} Returns the next item change.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-next
     */
    Next(cChanges, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, "ptr*", &ppChange := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISyncChange(ppChange)
    }

    /**
     * This method is not implemented. (IEnumSyncChanges.Skip)
     * @param {Integer} cChanges The number of changes to skip.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-skip
     */
    Skip(cChanges) {
        result := ComCall(4, this, "uint", cChanges, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the list. (IEnumSyncChanges.Reset)
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is not implemented. (IEnumSyncChanges.Clone)
     * @returns {IEnumSyncChanges} Returns the cloned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChanges(ppEnum)
    }

    Query(iid) {
        if (IEnumSyncChanges.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
