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
     * 
     * @param {Integer} copy 
     * @param {Pointer<UInt32>} pdwAttributes 
     * @returns {HRESULT} 
     */
    GetAttributes(copy, pdwAttributes) {
        result := ComCall(3, this, "int", copy, "uint*", pdwAttributes, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    GetTimes(copy, pftCreationTime, pftLastWriteTime, pftChangeTime, pftLastAccessTime) {
        result := ComCall(4, this, "int", copy, "ptr", pftCreationTime, "ptr", pftLastWriteTime, "ptr", pftChangeTime, "ptr", pftLastAccessTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @param {Integer} copy 
     * @param {Pointer<Int64>} pSize 
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
        result := ComCall(5, this, "int", copy, "int64*", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
