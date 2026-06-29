#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IClockVector.ahk" { IClockVector }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a clock vector that contains FeedSync information.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ifeedclockvector
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFeedClockVector extends IClockVector {
    /**
     * The interface identifier for IFeedClockVector
     * @type {Guid}
     */
    static IID := Guid("{8d1d98d1-9fb8-4ec9-a553-54dd924e0f67}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedClockVector interfaces
    */
    struct Vtbl extends IClockVector.Vtbl {
        GetUpdateCount         : IntPtr
        IsNoConflictsSpecified : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedClockVector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of updates that have been made to the FeedSync item.
     * @param {Pointer<Integer>} pdwUpdateCount Returns the number of updates that have been made to the FeedSync item. This value corresponds to the <b>updates</b> attribute of the FeedSync item.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifeedclockvector-getupdatecount
     */
    GetUpdateCount(pdwUpdateCount) {
        pdwUpdateCountMarshal := pdwUpdateCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwUpdateCountMarshal, pdwUpdateCount, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether conflicts are preserved for the FeedSync item.
     * @param {Pointer<BOOL>} pfIsNoConflictsSpecified TRUE if conflicts are not preserved for the item; otherwise, <b>FALSE</b>. This value corresponds to the <b>noconflicts</b> attribute of the FeedSync item.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifeedclockvector-isnoconflictsspecified
     */
    IsNoConflictsSpecified(pfIsNoConflictsSpecified) {
        pfIsNoConflictsSpecifiedMarshal := pfIsNoConflictsSpecified is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pfIsNoConflictsSpecifiedMarshal, pfIsNoConflictsSpecified, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFeedClockVector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUpdateCount := CallbackCreate(GetMethod(implObj, "GetUpdateCount"), flags, 2)
        this.vtbl.IsNoConflictsSpecified := CallbackCreate(GetMethod(implObj, "IsNoConflictsSpecified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUpdateCount)
        CallbackFree(this.vtbl.IsNoConflictsSpecified)
    }
}
