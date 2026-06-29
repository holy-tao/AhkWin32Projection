#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\OFFLINEFILES_ITEM_COPY.ahk" { OFFLINEFILES_ITEM_COPY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the standard information associated with a file system item in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesfilesysinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesFileSysInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesFileSysInfo
     * @type {Guid}
     */
    static IID := Guid("{bc1a163f-7bfd-4d88-9c66-96ea9a6a3d6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesFileSysInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAttributes : IntPtr
        GetTimes      : IntPtr
        GetFileSize   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesFileSysInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the Win32 attributes for an item.
     * @param {OFFLINEFILES_ITEM_COPY} copy An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_copy">OFFLINEFILES_ITEM_COPY</a> enumeration value identifying which copy (local or remote) to retrieve the attributes for.
     * 
     * <b>Windows Vista:  </b>This value must be <b>OFFLINEFILES_ITEM_COPY_LOCAL</b>.
     * @returns {Integer} Receives the file attribute mask for the item.  One or more of <b>FILE_ATTRIBUTE_<i>XXXXXX</i></b> as defined in the Windows SDK. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-getattributes
     */
    GetAttributes(copy) {
        result := ComCall(3, this, OFFLINEFILES_ITEM_COPY, copy, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * Retrieves the time values associated with an item.
     * @remarks
     * The time values returned directly correspond to the Win32 file time values used by the NTFS file system.
     * @param {OFFLINEFILES_ITEM_COPY} copy An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_copy">OFFLINEFILES_ITEM_COPY</a> enumeration value identifying which copy (local or remote) to retrieve the time values for.
     * 
     * <b>Windows Vista:  </b>This value must be <b>OFFLINEFILES_ITEM_COPY_LOCAL</b>.
     * @param {Pointer<FILETIME>} pftCreationTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's creation time.
     * @param {Pointer<FILETIME>} pftLastWriteTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-write time.  This is the time the item's data was last written to.
     * @param {Pointer<FILETIME>} pftChangeTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-change time.  This is the time the item's data or attributes were last changed.
     * @param {Pointer<FILETIME>} pftLastAccessTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-access time.  This is the time the item was last read from or written to.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-gettimes
     */
    GetTimes(copy, pftCreationTime, pftLastWriteTime, pftChangeTime, pftLastAccessTime) {
        result := ComCall(4, this, OFFLINEFILES_ITEM_COPY, copy, FILETIME.Ptr, pftCreationTime, FILETIME.Ptr, pftLastWriteTime, FILETIME.Ptr, pftChangeTime, FILETIME.Ptr, pftLastAccessTime, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of an item.
     * @param {OFFLINEFILES_ITEM_COPY} copy An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_copy">OFFLINEFILES_ITEM_COPY</a> enumeration value identifying which copy (local or remote) to retrieve the size of.
     * 
     * <b>Windows Vista:  </b>This value must be <b>OFFLINEFILES_ITEM_COPY_LOCAL</b>.
     * @returns {Integer} Receive the size, in bytes, of the item.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-getfilesize
     */
    GetFileSize(copy) {
        result := ComCall(5, this, OFFLINEFILES_ITEM_COPY, copy, "int64*", &pSize := 0, "HRESULT")
        return pSize
    }

    Query(iid) {
        if (IOfflineFilesFileSysInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAttributes := CallbackCreate(GetMethod(implObj, "GetAttributes"), flags, 3)
        this.vtbl.GetTimes := CallbackCreate(GetMethod(implObj, "GetTimes"), flags, 6)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAttributes)
        CallbackFree(this.vtbl.GetTimes)
        CallbackFree(this.vtbl.GetFileSize)
    }
}
