#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use the IEnumBackgroundCopyGroups interface to enumerate the list of groups in the download queue. To get an IEnumBackgroundCopyGroups interface pointer, call the IBackgroundCopyQMgr::EnumGroups method.
 * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ienumbackgroundcopygroups
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IEnumBackgroundCopyGroups extends IUnknown {
    /**
     * The interface identifier for IEnumBackgroundCopyGroups
     * @type {Guid}
     */
    static IID := Guid("{d993e603-4aa4-47c5-8665-c20d39c2ba4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumBackgroundCopyGroups interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next     : IntPtr
        Skip     : IntPtr
        Reset    : IntPtr
        Clone    : IntPtr
        GetCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumBackgroundCopyGroups.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Use the Next method to retrieve the specified number of items in the enumeration sequence. If there are fewer than the requested number of elements left in the sequence, it retrieves the remaining elements. (IEnumBackgroundCopyGroups.Next)
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Guid>} rgelt Array of GUIDs that identify the groups. To retrieve a group, call the <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nf-qmgr-ibackgroundcopyqmgr-getgroup">IBackgroundCopyQMgr::GetGroup</a> method with the GUID.
     * @param {Pointer<Integer>} pceltFetched Number of elements in <i>rgelt</i>. You can set <i>pceltFetched</i> to <b>NULL</b> if <i>celt</i> is one.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the number of requested elements.
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
     * Returned less than the number of requested elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ienumbackgroundcopygroups-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, Guid.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Use the Skip method to skip the next specified number of elements in the enumeration sequence. If there are fewer elements left in the sequence than the requested number of elements to skip, it skips past the last element in the sequence. (IEnumBackgroundCopyGroups.Skip)
     * @param {Integer} celt Number of elements to skip.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully skipped the number of requested elements.
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
     * Skipped less than the number of requested elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ienumbackgroundcopygroups-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Use the Reset method to reset the enumeration sequence to the beginning. (IEnumBackgroundCopyGroups.Reset)
     * @returns {HRESULT} This method returns <b>S_OK</b> on success.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ienumbackgroundcopygroups-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Use the Clone method to create another IEnumBackgroundCopyGroups enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumBackgroundCopyGroups} Receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined. You must release <i>ppenum</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ienumbackgroundcopygroups-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumBackgroundCopyGroups(ppenum)
    }

    /**
     * Use the GetCount method to retrieve a count of the number of groups in the enumeration.
     * @returns {Integer} Number of groups in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ienumbackgroundcopygroups-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    Query(iid) {
        if (IEnumBackgroundCopyGroups.IID.Equals(iid)) {
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
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
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
        CallbackFree(this.vtbl.GetCount)
    }
}
