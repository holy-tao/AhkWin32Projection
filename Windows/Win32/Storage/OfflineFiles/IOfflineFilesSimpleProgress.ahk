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
     * Reports that an operation on an item is beginning.
     * @param {PWSTR} pszFile Receives the fully qualified UNC path of the file or directory that is being processed.
     * @returns {Integer} Set this parameter to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_op_response">OFFLINEFILES_OP_RESPONSE</a> enumeration that indicates how the operation is to proceed
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilessimpleprogress-itembegin
     */
    ItemBegin(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(6, this, "ptr", pszFile, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * Reports that an item has been processed during the operation.
     * @param {PWSTR} pszFile Receives the fully qualified UNC path of the item that was processed.
     * @param {HRESULT} hrResult Receives the result of the operation for the item.  Contains S_OK if the operation completed successfully or an error value otherwise.
     * @returns {Integer} Set this parameter to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_op_response">OFFLINEFILES_OP_RESPONSE</a> enumeration that indicates how the operation is to proceed.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilessimpleprogress-itemresult
     */
    ItemResult(pszFile, hrResult) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", hrResult, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }
}
