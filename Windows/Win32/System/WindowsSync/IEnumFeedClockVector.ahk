#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFeedClockVectorElement.ahk" { IFeedClockVectorElement }

/**
 * Enumerates the clock vector elements that are stored in a clock vector that contains FeedSync information.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ienumfeedclockvector
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IEnumFeedClockVector extends IUnknown {
    /**
     * The interface identifier for IEnumFeedClockVector
     * @type {Guid}
     */
    static IID := Guid("{550f763d-146a-48f6-abeb-6c88c7f70514}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumFeedClockVector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumFeedClockVector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next elements in the clock vector, if available.
     * @param {Integer} cClockVectorElements The number of clock vector elements to retrieve.
     * @param {Pointer<Integer>} pcFetched Returns the number of clock vector elements that were retrieved. This value can be <b>NULL</b> if <i>cClockVectorElements</i> is 1; otherwise, it cannot be <b>NULL</b>.
     * @returns {IFeedClockVectorElement} Returns the next <i>pcFetched</i> clock vector elements.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumfeedclockvector-next
     */
    Next(cClockVectorElements, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cClockVectorElements, "ptr*", &ppiClockVectorElements := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IFeedClockVectorElement(ppiClockVectorElements)
    }

    /**
     * Skips the specified number of clock vector elements. (IEnumFeedClockVector.Skip)
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
     * The enumerator reaches the end of its list before it can skip <i>cSyncVersions</i> elements. In this case, the enumerator skips as many elements as possible.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumfeedclockvector-skip
     */
    Skip(cSyncVersions) {
        result := ComCall(4, this, "uint", cSyncVersions, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator to the beginning of the clock vector. (IEnumFeedClockVector.Reset)
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumfeedclockvector-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones the enumerator and returns a new enumerator that is in the same state as the current one. (IEnumFeedClockVector.Clone)
     * @returns {IEnumFeedClockVector} Returns the newly cloned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumfeedclockvector-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppiEnum := 0, "HRESULT")
        return IEnumFeedClockVector(ppiEnum)
    }

    Query(iid) {
        if (IEnumFeedClockVector.IID.Equals(iid)) {
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
