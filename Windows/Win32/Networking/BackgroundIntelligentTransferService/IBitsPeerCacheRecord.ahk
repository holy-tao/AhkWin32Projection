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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getid
     */
    GetId() {
        pVal := Guid()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getoriginurl
     */
    GetOriginUrl() {
        result := ComCall(4, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getfilemodificationtime
     */
    GetFileModificationTime() {
        pVal := FILETIME()
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getlastaccesstime
     */
    GetLastAccessTime() {
        pVal := FILETIME()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
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
