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
     * 
     * @param {Integer} copy 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-getattributes
     */
    GetAttributes(copy) {
        result := ComCall(3, this, "int", copy, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * 
     * @param {Integer} copy 
     * @param {Pointer<FILETIME>} pftCreationTime 
     * @param {Pointer<FILETIME>} pftLastWriteTime 
     * @param {Pointer<FILETIME>} pftChangeTime 
     * @param {Pointer<FILETIME>} pftLastAccessTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-gettimes
     */
    GetTimes(copy, pftCreationTime, pftLastWriteTime, pftChangeTime, pftLastAccessTime) {
        result := ComCall(4, this, "int", copy, "ptr", pftCreationTime, "ptr", pftLastWriteTime, "ptr", pftChangeTime, "ptr", pftLastAccessTime, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @param {Integer} copy 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize(copy) {
        result := ComCall(5, this, "int", copy, "int64*", &pSize := 0, "HRESULT")
        return pSize
    }
}
