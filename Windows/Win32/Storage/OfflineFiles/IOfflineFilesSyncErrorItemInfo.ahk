#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides file attributes, time information, and file size for an item associated with a sync error.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessyncerroriteminfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSyncErrorItemInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesSyncErrorItemInfo
     * @type {Guid}
     */
    static IID := Guid("{ecdbaf0d-6a18-4d55-8017-108f7660ba44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSyncErrorItemInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFileAttributes : IntPtr
        GetFileTimes      : IntPtr
        GetFileSize       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSyncErrorItemInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the Win32 file attributes for the item.
     * @returns {Integer} Receives the file attribute mask for the item.  One or more of FILE_ATTRIBUTE_XXXXXX as defined in the Windows SDK. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerroriteminfo-getfileattributes
     */
    GetFileAttributes() {
        result := ComCall(3, this, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * Retrieves the last-write and change times for the item.
     * @param {Pointer<FILETIME>} pftLastWrite Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-write time value.
     * @param {Pointer<FILETIME>} pftChange Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's change time value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerroriteminfo-getfiletimes
     */
    GetFileTimes(pftLastWrite, pftChange) {
        result := ComCall(4, this, FILETIME.Ptr, pftLastWrite, FILETIME.Ptr, pftChange, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the item in bytes.
     * @returns {Integer} Receives the item's size in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerroriteminfo-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "int64*", &pSize := 0, "HRESULT")
        return pSize
    }

    Query(iid) {
        if (IOfflineFilesSyncErrorItemInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFileAttributes := CallbackCreate(GetMethod(implObj, "GetFileAttributes"), flags, 2)
        this.vtbl.GetFileTimes := CallbackCreate(GetMethod(implObj, "GetFileTimes"), flags, 3)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFileAttributes)
        CallbackFree(this.vtbl.GetFileTimes)
        CallbackFree(this.vtbl.GetFileSize)
    }
}
