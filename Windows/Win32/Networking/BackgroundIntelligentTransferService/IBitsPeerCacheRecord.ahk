#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
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
     * Gets the identifier that uniquely identifies the record in the cache.
     * @returns {Guid} Identifier that uniquely identifies the record in the cache.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-getid
     */
    GetId() {
        pVal := Guid()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the origin URL of the cached file.
     * @returns {PWSTR} Null-terminated string that contains the origin URL of the cached file. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppOriginUrl</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-getoriginurl
     */
    GetOriginUrl() {
        result := ComCall(4, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets the size of the file.
     * @returns {Integer} Size of the file, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets the date and time that the file was last modified on the server.
     * @returns {FILETIME} Date and time that the file was last modified on the server. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-getfilemodificationtime
     */
    GetFileModificationTime() {
        pVal := FILETIME()
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the date and time that the file was last accessed.
     * @returns {FILETIME} Date and time that the file was last accessed. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-getlastaccesstime
     */
    GetLastAccessTime() {
        pVal := FILETIME()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Determines whether the file has been validated.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File has been validated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File has not been validated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-isfilevalidated
     */
    IsFileValidated() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Gets the ranges of the file that are in the cache.
     * @param {Pointer<Integer>} pRangeCount Number of elements in <i>ppRanges</i>.
     * @param {Pointer<Pointer<BG_FILE_RANGE>>} ppRanges Array of  <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/ns-bits2_0-bg_file_range">BG_FILE_RANGE</a> structures that specify the ranges of the file that are in the cache. When done, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppRanges</i>.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacherecord-getfileranges
     */
    GetFileRanges(pRangeCount, ppRanges) {
        pRangeCountMarshal := pRangeCount is VarRef ? "uint*" : "ptr"
        ppRangesMarshal := ppRanges is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pRangeCountMarshal, pRangeCount, ppRangesMarshal, ppRanges, "HRESULT")
        return result
    }
}
