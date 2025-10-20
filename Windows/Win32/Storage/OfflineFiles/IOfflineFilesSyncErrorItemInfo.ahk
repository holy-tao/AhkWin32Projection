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
     * 
     * @param {Pointer<UInt32>} pdwAttributes 
     * @returns {HRESULT} 
     */
    GetFileAttributes(pdwAttributes) {
        result := ComCall(3, this, "uint*", pdwAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftLastWrite 
     * @param {Pointer<FILETIME>} pftChange 
     * @returns {HRESULT} 
     */
    GetFileTimes(pftLastWrite, pftChange) {
        result := ComCall(4, this, "ptr", pftLastWrite, "ptr", pftChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
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
    GetFileSize(pSize) {
        result := ComCall(5, this, "int64*", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
