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
     * @param {Pointer<Integer>} pdwAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesfilesysinfo-getattributes
     */
    GetAttributes(copy, pdwAttributes) {
        result := ComCall(3, this, "int", copy, "uint*", pdwAttributes, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pSize 
     * @returns {HRESULT} If the function succeeds, the return value is the low-order doubleword of the file size, and, if 
     *        <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the function puts the 
     *        high-order doubleword of the file size into the variable pointed to by that parameter.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is <b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. When 
     *        <i>lpFileSizeHigh</i> is <b>NULL</b>, the results returned for large 
     *        files are ambiguous, and you will not be able to determine the actual size of the file. It is recommended that 
     *        you use <a href="/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex">GetFileSizeEx</a> instead.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b> and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return a value other than 
     *        <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize(copy, pSize) {
        result := ComCall(5, this, "int", copy, "int64*", pSize, "HRESULT")
        return result
    }
}
