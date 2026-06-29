#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesProgress.ahk" { IOfflineFilesProgress }
#Import ".\IOfflineFilesSyncErrorInfo.ahk" { IOfflineFilesSyncErrorInfo }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OFFLINEFILES_OP_RESPONSE.ahk" { OFFLINEFILES_OP_RESPONSE }

/**
 * Used to report progress back to the caller during synchronization and synchronization-related operations.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessyncprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSyncProgress extends IOfflineFilesProgress {
    /**
     * The interface identifier for IOfflineFilesSyncProgress
     * @type {Guid}
     */
    static IID := Guid("{6931f49a-6fc7-4c1b-b265-56793fc451b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSyncProgress interfaces
    */
    struct Vtbl extends IOfflineFilesProgress.Vtbl {
        SyncItemBegin  : IntPtr
        SyncItemResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSyncProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports that a synchronization operation on an item is beginning.
     * @param {PWSTR} pszFile Receives the fully qualified UNC path of the file or directory to be processed.
     * @returns {OFFLINEFILES_OP_RESPONSE} Your implementation of this method should set this parameter to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_op_response">OFFLINEFILES_OP_RESPONSE</a> enumeration that indicates how the operation is to proceed.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncprogress-syncitembegin
     */
    SyncItemBegin(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(6, this, "ptr", pszFile, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * Reports that an item has been processed during the synchronization operation.
     * @param {PWSTR} pszFile Receives the fully qualified UNC path of the item that was processed.
     * @param {HRESULT} hrResult Receives the result of the operation for the item.  Contains S_OK if the operation completed successfully or an error value otherwise.
     * @param {IOfflineFilesSyncErrorInfo} pErrorInfo Receives a pointer to an instance of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncerrorinfo">IOfflineFilesSyncErrorInfo</a> interface that provides detailed information about the result of the sync operation.
     * @returns {OFFLINEFILES_OP_RESPONSE} Set this parameter to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_op_response">OFFLINEFILES_OP_RESPONSE</a> enumeration that indicates how the operation is to proceed.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncprogress-syncitemresult
     */
    SyncItemResult(pszFile, hrResult, pErrorInfo) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", hrResult, "ptr", pErrorInfo, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    Query(iid) {
        if (IOfflineFilesSyncProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SyncItemBegin := CallbackCreate(GetMethod(implObj, "SyncItemBegin"), flags, 3)
        this.vtbl.SyncItemResult := CallbackCreate(GetMethod(implObj, "SyncItemResult"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SyncItemBegin)
        CallbackFree(this.vtbl.SyncItemResult)
    }
}
