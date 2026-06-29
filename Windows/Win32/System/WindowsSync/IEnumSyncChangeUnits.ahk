#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncChangeUnit.ahk" { ISyncChangeUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates a list of change units.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ienumsyncchangeunits
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IEnumSyncChangeUnits extends IUnknown {
    /**
     * The interface identifier for IEnumSyncChangeUnits
     * @type {Guid}
     */
    static IID := Guid("{346b35f1-8703-4c6d-ab1a-4dbca2cff97f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSyncChangeUnits interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSyncChangeUnits.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next change unit.
     * @remarks
     * This method currently only supports retrieval of a single change unit. Therefore, <i>cChanges</i> must be 1. Otherwise, the call will fail.
     * @param {Integer} cChanges The number of change units to fetch. The only valid value is 1.
     * @param {Pointer<Integer>} pcFetched Returns the number of change units that are fetched.
     * @returns {ISyncChangeUnit} Returns the next change unit object.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchangeunits-next
     */
    Next(cChanges, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, "ptr*", &ppChangeUnit := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISyncChangeUnit(ppChangeUnit)
    }

    /**
     * This method is not implemented. (IEnumSyncChangeUnits.Skip)
     * @param {Integer} cChanges The number of change units to skip.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchangeunits-skip
     */
    Skip(cChanges) {
        result := ComCall(4, this, "uint", cChanges, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the list. (IEnumSyncChangeUnits.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchangeunits-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * This method is not implemented. (IEnumSyncChangeUnits.Clone)
     * @returns {IEnumSyncChangeUnits} Returns the cloned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchangeunits-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChangeUnits(ppEnum)
    }

    Query(iid) {
        if (IEnumSyncChangeUnits.IID.Equals(iid)) {
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
