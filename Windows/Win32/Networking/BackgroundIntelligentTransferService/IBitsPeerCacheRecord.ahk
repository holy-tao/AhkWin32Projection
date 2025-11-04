#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsPeerCacheRecord to get information about a file in the cache.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibitspeercacherecord
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsPeerCacheRecord extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitsPeerCacheRecord
     * @type {Guid}
     */
    static IID => Guid("{659cdeaf-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetOriginUrl", "GetFileSize", "GetFileModificationTime", "GetLastAccessTime", "IsFileValidated", "GetFileRanges"]

    /**
     * 
     * @param {Pointer<Guid>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getid
     */
    GetId(pVal) {
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getoriginurl
     */
    GetOriginUrl(pVal) {
        result := ComCall(4, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @param {Pointer<Integer>} pVal 
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
    GetFileSize(pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getfilemodificationtime
     */
    GetFileModificationTime(pVal) {
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getlastaccesstime
     */
    GetLastAccessTime(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-isfilevalidated
     */
    IsFileValidated() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRangeCount 
     * @param {Pointer<Pointer<BG_FILE_RANGE>>} ppRanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getfileranges
     */
    GetFileRanges(pRangeCount, ppRanges) {
        pRangeCountMarshal := pRangeCount is VarRef ? "uint*" : "ptr"
        ppRangesMarshal := ppRanges is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pRangeCountMarshal, pRangeCount, ppRangesMarshal, ppRanges, "HRESULT")
        return result
    }
}
