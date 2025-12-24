#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the standard information associated with a file system item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesfilesysinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesFileSysInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesFileSysInfo
     * @type {Guid}
     */
    static IID => Guid("{bc1a163f-7bfd-4d88-9c66-96ea9a6a3d6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributes", "GetTimes", "GetFileSize"]

    /**
     * Retrieves the Win32 attributes for an item.
     * @param {Integer} copy An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_copy">OFFLINEFILES_ITEM_COPY</a> enumeration value identifying which copy (local or remote) to retrieve the attributes for.
     * 
     * <b>Windows Vista:  </b>This value must be <b>OFFLINEFILES_ITEM_COPY_LOCAL</b>.
     * @returns {Integer} Receives the file attribute mask for the item.  One or more of <b>FILE_ATTRIBUTE_<i>XXXXXX</i></b> as defined in the Windows SDK. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesfilesysinfo-getattributes
     */
    GetAttributes(copy) {
        result := ComCall(3, this, "int", copy, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * Retrieves the time values associated with an item.
     * @param {Integer} copy An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_copy">OFFLINEFILES_ITEM_COPY</a> enumeration value identifying which copy (local or remote) to retrieve the time values for.
     * 
     * <b>Windows Vista:  </b>This value must be <b>OFFLINEFILES_ITEM_COPY_LOCAL</b>.
     * @param {Pointer<FILETIME>} pftCreationTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's creation time.
     * @param {Pointer<FILETIME>} pftLastWriteTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-write time.  This is the time the item's data was last written to.
     * @param {Pointer<FILETIME>} pftChangeTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-change time.  This is the time the item's data or attributes were last changed.
     * @param {Pointer<FILETIME>} pftLastAccessTime Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the item's last-access time.  This is the time the item was last read from or written to.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesfilesysinfo-gettimes
     */
    GetTimes(copy, pftCreationTime, pftLastWriteTime, pftChangeTime, pftLastAccessTime) {
        result := ComCall(4, this, "int", copy, "ptr", pftCreationTime, "ptr", pftLastWriteTime, "ptr", pftChangeTime, "ptr", pftLastAccessTime, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of an item.
     * @param {Integer} copy An <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_item_copy">OFFLINEFILES_ITEM_COPY</a> enumeration value identifying which copy (local or remote) to retrieve the size of.
     * 
     * <b>Windows Vista:  </b>This value must be <b>OFFLINEFILES_ITEM_COPY_LOCAL</b>.
     * @returns {Integer} Receive the size, in bytes, of the item.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesfilesysinfo-getfilesize
     */
    GetFileSize(copy) {
        result := ComCall(5, this, "int", copy, "int64*", &pSize := 0, "HRESULT")
        return pSize
    }
}
