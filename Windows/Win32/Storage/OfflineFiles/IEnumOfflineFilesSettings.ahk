#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesSetting.ahk" { IOfflineFilesSetting }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates setting objects associated with the Offline Files service.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-ienumofflinefilessettings
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IEnumOfflineFilesSettings extends IUnknown {
    /**
     * The interface identifier for IEnumOfflineFilesSettings
     * @type {Guid}
     */
    static IID := Guid("{729680c4-1a38-47bc-9e5c-02c51562ac30}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumOfflineFilesSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumOfflineFilesSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the next item in the enumeration and advances the enumerator. (IEnumOfflineFilesSettings.Next)
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<IOfflineFilesSetting>} rgelt Array of elements returned.
     * @param {Pointer<Integer>} pceltFetched Number of elements returned.
     * @returns {HRESULT} Returns <b>S_OK</b> if the number of elements returned is <i>celt</i>; S_FALSE if a number less than <i>celt</i> is returned; or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilessettings-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IOfflineFilesSetting.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips over the next specified number of elements in the enumeration. (IEnumOfflineFilesSettings.Skip)
     * @param {Integer} celt Number of elements to be skipped.
     * @returns {HRESULT} Returns <b>S_OK</b> if the number of elements skipped is <i>celt</i>; S_FALSE if a number less than <i>celt</i> is skipped; or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilessettings-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration to the beginning. (IEnumOfflineFilesSettings.Reset)
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilessettings-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of the enumerator with the same enumeration state as the current one. (IEnumOfflineFilesSettings.Clone)
     * @returns {IEnumOfflineFilesSettings} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-ienumofflinefilessettings">IEnumOfflineFilesSettings</a> pointer variable that receives the interface pointer of the new enumeration object.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilessettings-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumOfflineFilesSettings(ppenum)
    }

    Query(iid) {
        if (IEnumOfflineFilesSettings.IID.Equals(iid)) {
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
