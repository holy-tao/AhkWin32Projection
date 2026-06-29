#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesProgress.ahk" { IOfflineFilesProgress }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OFFLINEFILES_OP_RESPONSE.ahk" { OFFLINEFILES_OP_RESPONSE }

/**
 * Used to report progress back to callers of lengthy Offline Files operations. (IOfflineFilesSimpleProgress)
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessimpleprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSimpleProgress extends IOfflineFilesProgress {
    /**
     * The interface identifier for IOfflineFilesSimpleProgress
     * @type {Guid}
     */
    static IID := Guid("{c34f7f9b-c43d-4f9d-a776-c0eb6de5d401}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSimpleProgress interfaces
    */
    struct Vtbl extends IOfflineFilesProgress.Vtbl {
        ItemBegin  : IntPtr
        ItemResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSimpleProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports that an operation on an item is beginning.
     * @param {PWSTR} pszFile Receives the fully qualified UNC path of the file or directory that is being processed.
     * @returns {OFFLINEFILES_OP_RESPONSE} Set this parameter to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_op_response">OFFLINEFILES_OP_RESPONSE</a> enumeration that indicates how the operation is to proceed
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessimpleprogress-itembegin
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
     * @returns {OFFLINEFILES_OP_RESPONSE} Set this parameter to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_op_response">OFFLINEFILES_OP_RESPONSE</a> enumeration that indicates how the operation is to proceed.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessimpleprogress-itemresult
     */
    ItemResult(pszFile, hrResult) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", hrResult, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    Query(iid) {
        if (IOfflineFilesSimpleProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ItemBegin := CallbackCreate(GetMethod(implObj, "ItemBegin"), flags, 3)
        this.vtbl.ItemResult := CallbackCreate(GetMethod(implObj, "ItemResult"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ItemBegin)
        CallbackFree(this.vtbl.ItemResult)
    }
}
