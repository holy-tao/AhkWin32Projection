#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesProgress.ahk

/**
 * Used to report progress back to callers of lengthy Offline Files operations.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessimpleprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSimpleProgress extends IOfflineFilesProgress{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesSimpleProgress
     * @type {Guid}
     */
    static IID => Guid("{c34f7f9b-c43d-4f9d-a776-c0eb6de5d401}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ItemBegin", "ItemResult"]

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {Pointer<Integer>} pResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessimpleprogress-itembegin
     */
    ItemBegin(pszFile, pResponse) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pszFile, pResponseMarshal, pResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {HRESULT} hrResult 
     * @param {Pointer<Integer>} pResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessimpleprogress-itemresult
     */
    ItemResult(pszFile, hrResult, pResponse) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        pResponseMarshal := pResponse is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pszFile, "int", hrResult, pResponseMarshal, pResponse, "HRESULT")
        return result
    }
}
