#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IChangeUnitException.ahk" { IChangeUnitException }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates change unit exceptions that are stored in a knowledge object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ienumchangeunitexceptions
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IEnumChangeUnitExceptions extends IUnknown {
    /**
     * The interface identifier for IEnumChangeUnitExceptions
     * @type {Guid}
     */
    static IID := Guid("{3074e802-9319-4420-be21-1022e2e21da8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumChangeUnitExceptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumChangeUnitExceptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next elements in the change unit exception set, if they are available. (IEnumChangeUnitExceptions.Next)
     * @param {Integer} cExceptions The number of change unit exceptions to retrieve in the range of zero to 1000.
     * @param {Pointer<Integer>} pcFetched Returns the number of change unit exceptions that are retrieved. This value can be <b>NULL</b> only if <i>cExceptions</i> is 1.
     * @returns {IChangeUnitException} Returns the next <i>pcFetched</i> change unit exceptions.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumchangeunitexceptions-next
     */
    Next(cExceptions, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cExceptions, "ptr*", &ppChangeUnitException := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IChangeUnitException(ppChangeUnitException)
    }

    /**
     * Skips the specified number of change unit exceptions.
     * @param {Integer} cExceptions The number of change unit exceptions to skip.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumerator reaches the end of the list before it can skip the specified number of change unit exceptions. In this case, the enumerator skips as many elements as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumchangeunitexceptions-skip
     */
    Skip(cExceptions) {
        result := ComCall(4, this, "uint", cExceptions, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the change unit exception set.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumchangeunitexceptions-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one. (IEnumChangeUnitExceptions.Clone)
     * @returns {IEnumChangeUnitExceptions} Returns the newly cloned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumchangeunitexceptions-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumChangeUnitExceptions(ppEnum)
    }

    Query(iid) {
        if (IEnumChangeUnitExceptions.IID.Equals(iid)) {
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
