#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPStorage.ahk" { IMDSPStorage }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMDSPEnumStorage interface is used to enumerate the storage media on a device.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspenumstorage
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPEnumStorage extends IUnknown {
    /**
     * The interface identifier for IMDSPEnumStorage
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a15-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPEnumStorage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPEnumStorage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method returns a pointer to the next celtIMDSPStorage interfaces.
     * @remarks
     * When there are no more storage interfaces, or when there are fewer storage interfaces than requested, the return value from <b>Next</b> is S_FALSE. When this happens, the <i>pceltFetched</i> parameter must be queried to determine how many interfaces, if any, were returned.
     * 
     * The storage enumerator may not reflect the effect of media insertion and removal. In such cases, the client should obtain a new enumerator object.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} celt Number of storage interfaces requested.
     * @param {Pointer<IMDSPStorage>} ppStorage Array of <i>celt</i><a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspstorage">IMDSPStorage</a> interface pointers allocated by the caller. Return <b>NULL</b> if no more storage media exist, or an error has occurred. If <i>celt</i> is more than 1, the caller must allocate enough memory to store <i>celt</i> number of interface pointers.
     * @param {Pointer<Integer>} pceltFetched Pointer to a <b>ULONG</b> variable that receives the count of interfaces returned.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumstorage-next
     */
    Next(celt, ppStorage, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IMDSPStorage.Ptr, ppStorage, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of storage interface(s) in the enumeration sequence.
     * @remarks
     * If the number specified in the <i>celt</i> parameter is greater than the actual number of storage interfaces remaining in the enumeration sequence, the return value from <b>Skip</b> is S_FALSE. When this happens, the <i>pceltFetched</i> parameter must be queried to determine how many interfaces were skipped. If you skip to the end of the array of storage interfaces, a subsequent call to <b>Next</b> returns S_FALSE.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} celt Number of elements to skip.
     * @returns {Integer} Pointer to the number of elements actually skipped.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumstorage-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "uint*", &pceltFetched := 0, "HRESULT")
        return pceltFetched
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. A subsequent call to the Next method fetches the first storage interface in the enumeration sequence.
     * @remarks
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumstorage-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. (IMDSPEnumStorage.Clone)
     * @remarks
     * Using this function, a client can record a particular point in the enumeration sequence, and return to that point at a later time. The new enumerator supports the same interface as the original one.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPEnumStorage} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumstorage">IMDSPEnumStorage</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumstorage-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumStorage := 0, "HRESULT")
        return IMDSPEnumStorage(ppEnumStorage)
    }

    Query(iid) {
        if (IMDSPEnumStorage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 3)
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
