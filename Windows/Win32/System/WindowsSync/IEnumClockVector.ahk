#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IClockVectorElement.ahk" { IClockVectorElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the clock vector elements that are stored in a clock vector.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ienumclockvector
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IEnumClockVector extends IUnknown {
    /**
     * The interface identifier for IEnumClockVector
     * @type {Guid}
     */
    static IID := Guid("{525844db-2837-4799-9e80-81a66e02220c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumClockVector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumClockVector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next elements in the clock vector, if they are available.
     * @param {Integer} cClockVectorElements The number of clock vector elements to retrieve in the range of zero to 1000.
     * @param {Pointer<Integer>} pcFetched Returns the number of clock vector elements that were retrieved. This value can be <b>NULL</b> if <i>cClockVectorElements</i> is 1; otherwise, it cannot be <b>NULL</b>.
     * @returns {IClockVectorElement} Returns the next <i>pcFetched</i> clock vector elements.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-next
     */
    Next(cClockVectorElements, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cClockVectorElements, "ptr*", &ppiClockVectorElements := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IClockVectorElement(ppiClockVectorElements)
    }

    /**
     * Skips the specified number of clock vector elements. (IEnumClockVector.Skip)
     * @param {Integer} cSyncVersions The number of elements to skip.
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
     * The enumerator reaches the end of its list before it skips <i>cSyncVersions</i>. In this case, the enumerator skips as many elements as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-skip
     */
    Skip(cSyncVersions) {
        result := ComCall(4, this, "uint", cSyncVersions, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the clock vector. (IEnumClockVector.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one. (IEnumClockVector.Clone)
     * @returns {IEnumClockVector} Returns the newly cloned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppiEnum := 0, "HRESULT")
        return IEnumClockVector(ppiEnum)
    }

    Query(iid) {
        if (IEnumClockVector.IID.Equals(iid)) {
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
