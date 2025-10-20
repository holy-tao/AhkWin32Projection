#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesProgress.ahk

/**
 * Used to report progress back to the caller during synchronization and synchronization-related operations.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessyncprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSyncProgress extends IOfflineFilesProgress{
    /**
     * The interface identifier for IOfflineFilesSyncProgress
     * @type {Guid}
     */
    static IID => Guid("{6931f49a-6fc7-4c1b-b265-56793fc451b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    SyncItemBegin(pszFile, pResponse) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(6, this, "ptr", pszFile, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {HRESULT} hrResult 
     * @param {Pointer<IOfflineFilesSyncErrorInfo>} pErrorInfo 
     * @param {Pointer<Int32>} pResponse 
     * @returns {HRESULT} 
     */
    SyncItemResult(pszFile, hrResult, pErrorInfo, pResponse) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", hrResult, "ptr", pErrorInfo, "int*", pResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
