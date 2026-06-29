#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBitsPeerCacheRecord.ahk" { IBitsPeerCacheRecord }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use IEnumBitsPeerCacheRecords to enumerate the records of the cache.
 * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nn-bits3_0-ienumbitspeercacherecords
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IEnumBitsPeerCacheRecords extends IUnknown {
    /**
     * The interface identifier for IEnumBitsPeerCacheRecords
     * @type {Guid}
     */
    static IID := Guid("{659cdea4-489e-11d9-a9cd-000d56965251}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumBitsPeerCacheRecords interfaces
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
            this.vtbl := IEnumBitsPeerCacheRecords.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a specified number of items in the enumeration sequence. If there are fewer than the requested number of elements left in the sequence, it retrieves the remaining elements. (IEnumBitsPeerCacheRecords.Next)
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pceltFetched Number of elements returned in <i>rgelt</i>. You can set <i>pceltFetched</i> to <b>NULL</b> if <i>celt</i> is one. Otherwise, initialize the value of <i>pceltFetched</i> to 0 before calling this method.
     * @returns {IBitsPeerCacheRecord} Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nn-bits3_0-ibitspeercacherecord">IBitsPeerCacheRecord</a> objects. You must release each object in <i>rgelt</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return IBitsPeerCacheRecord(rgelt)
    }

    /**
     * Skips the next specified number of elements in the enumeration sequence. If there are fewer elements left in the sequence than the requested number of elements to skip, it skips past the last element in the sequence. (IEnumBitsPeerCacheRecords.Skip)
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
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning. (IEnumBitsPeerCacheRecords.Reset)
     * @returns {HRESULT} This method returns <b>S_OK</b> on success or one of the standard COM <b>HRESULT</b> values on error.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates another IEnumBitsPeerCacheRecords enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumBitsPeerCacheRecords} Receives the interface pointer to the enumeration object. If the method is unsuccessful, the value of this output variable is undefined. You must release <i>ppEnum</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumBitsPeerCacheRecords(ppenum)
    }

    /**
     * Retrieves a count of the number of cache records in the enumeration.
     * @returns {Integer} Number of cache records in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ienumbitspeercacherecords-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    Query(iid) {
        if (IEnumBitsPeerCacheRecords.IID.Equals(iid)) {
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
