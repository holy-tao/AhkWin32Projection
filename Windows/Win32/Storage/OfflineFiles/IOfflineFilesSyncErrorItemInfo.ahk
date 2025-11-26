#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides file attributes, time information, and file size for an item associated with a sync error.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessyncerroriteminfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSyncErrorItemInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesSyncErrorItemInfo
     * @type {Guid}
     */
    static IID => Guid("{ecdbaf0d-6a18-4d55-8017-108f7660ba44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileAttributes", "GetFileTimes", "GetFileSize"]

    /**
     * Retrieves the Win32 file attributes for the item.
     * @returns {Integer} Receives the file attribute mask for the item.  One or more of FILE_ATTRIBUTE_XXXXXX as defined in the Windows SDK. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilessyncerroriteminfo-getfileattributes
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
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilessyncerroriteminfo-getfiletimes
     */
    GetFileTimes(pftLastWrite, pftChange) {
        result := ComCall(4, this, "ptr", pftLastWrite, "ptr", pftChange, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the item in bytes.
     * @returns {Integer} Receives the item's size in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilessyncerroriteminfo-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "int64*", &pSize := 0, "HRESULT")
        return pSize
    }
}
