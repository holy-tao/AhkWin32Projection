#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDiskQuotaUser.ahk" { IDiskQuotaUser }

/**
 * Enumerates user quota entries on the volume.
 * @see https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-ienumdiskquotausers
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IEnumDiskQuotaUsers extends IUnknown {
    /**
     * The interface identifier for IEnumDiskQuotaUsers
     * @type {Guid}
     */
    static IID := Guid("{7988b577-ec89-11cf-9c00-00aa00a14f56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumDiskQuotaUsers interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumDiskQuotaUsers.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of user quota entries that are next in the enumeration sequence.
     * @param {Integer} cUsers The number of elements being requested.
     * @param {Pointer<Integer>} pcUsersFetched On input, the number of elements in <i>rgUsers</i>, on input. On output, the number of elements actually retrieved. The caller can pass in <b>NULL</b> if <i>cUsers</i> is one and the number of elements retrieved is of no interest.
     * @returns {IDiskQuotaUser} An array of size <i>cUsers</i> or larger.
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-next
     */
    Next(cUsers, pcUsersFetched) {
        pcUsersFetchedMarshal := pcUsersFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cUsers, "ptr*", &rgUsers := 0, pcUsersFetchedMarshal, pcUsersFetched, "HRESULT")
        return IDiskQuotaUser(rgUsers)
    }

    /**
     * Skips over the specified number of user quota entries that are next in the enumeration sequence.
     * @param {Integer} cUsers The number of elements to be skipped.
     * @returns {HRESULT} The return value is <b>S_OK</b> if the number of elements skipped is 
     *        <i>cUsers</i>; otherwise, the return value is <b>S_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-skip
     */
    Skip(cUsers) {
        result := ComCall(4, this, "uint", cUsers, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning of the set of user quota entries.
     * @returns {HRESULT} The return value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates another enumerator of user quota entries that contains the same enumeration state as the current one.
     * @returns {IEnumDiskQuotaUsers} A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-ienumdiskquotausers">IEnumDiskQuotaUsers</a> interface pointer. If the method is unsuccessful, the value of this variable is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-ienumdiskquotausers-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiskQuotaUsers(ppEnum)
    }

    Query(iid) {
        if (IEnumDiskQuotaUsers.IID.Equals(iid)) {
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
