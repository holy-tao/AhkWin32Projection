#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDMStorage.ahk" { IWMDMStorage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDMEnumStorage interface enumerates storages on a device.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmenumstorage
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMEnumStorage extends IUnknown {
    /**
     * The interface identifier for IWMDMEnumStorage
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a05-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMEnumStorage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMEnumStorage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves a pointer to the next sibling storage.
     * @remarks
     * Windows Media Device Manager delegates the storage enumeration to the corresponding service provider. For information on service provider storage enumeration, see the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumstorage">IMDSPEnumStorage</a> interface.
     * 
     * The storage enumerator may not reflect the effect of media insertion and removal. In that case, the application should obtain a new storage enumerator object by calling <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice-enumstorage">IWMDMDevice::EnumStorage</a> to get the refreshed list. If you only want to retrieve a single interface at a time, you do not need to allocate an array for this method, as shown in the following code.
     * @param {Integer} celt Number of storages requested.
     * @param {Pointer<IWMDMStorage>} ppStorage Pointer to caller-allocated array of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface pointers. The size of this array must be <b>IWMDMStorage</b> *[celt]. The caller must release these interfaces when done with them. To avoid allocating a whole array, simply pass in the address of a pointer to an <b>IWMDMStorage</b> interface, as shown in Remarks.
     * @param {Pointer<Integer>} pceltFetched Number of storages enumerated.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-next
     */
    Next(celt, ppStorage, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IWMDMStorage.Ptr, ppStorage, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the specified number of storages in the enumeration sequence.
     * @remarks
     * If the number of devices specified in <i>celt</i> is greater than the actual number of storage interfaces remaining in the enumeration sequence, this function will return S_FALSE. When this happens, <i>pceltFetched</i> must be queried to determine how many interfaces were actually skipped. If you skip to the end of the array of storage interfaces, a subsequent call to <b>Next</b> returns S_FALSE.
     * @param {Integer} celt The number of storages to skip.
     * @returns {Integer} The number of storages skipped.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "uint*", &pceltFetched := 0, "HRESULT")
        return pceltFetched
    }

    /**
     * The Reset method sets the enumeration sequence back to the beginning.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator with the same enumeration state as the current enumerator.
     * @remarks
     * Using this function, a client can record a particular point in the enumeration sequence and return to that point later. The new enumerator supports the same interface as the original enumerator.
     * @returns {IWMDMEnumStorage} An <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumstorage">IWMDMEnumStorage</a> interface of the cloned enumerator. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmenumstorage-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumStorage := 0, "HRESULT")
        return IWMDMEnumStorage(ppEnumStorage)
    }

    Query(iid) {
        if (IWMDMEnumStorage.IID.Equals(iid)) {
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
