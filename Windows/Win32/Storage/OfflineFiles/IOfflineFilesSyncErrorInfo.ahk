#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesErrorInfo.ahk" { IOfflineFilesErrorInfo }
#Import ".\OFFLINEFILES_SYNC_OPERATION.ahk" { OFFLINEFILES_SYNC_OPERATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOfflineFilesSyncErrorItemInfo.ahk" { IOfflineFilesSyncErrorItemInfo }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Supplied with the IOfflineFilesSyncProgress::SyncItemResult method to communicate details about the item that experienced a sync error.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessyncerrorinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSyncErrorInfo extends IOfflineFilesErrorInfo {
    /**
     * The interface identifier for IOfflineFilesSyncErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{59f95e46-eb54-49d1-be76-de95458d01b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSyncErrorInfo interfaces
    */
    struct Vtbl extends IOfflineFilesErrorInfo.Vtbl {
        GetSyncOperation   : IntPtr
        GetItemChangeFlags : IntPtr
        InfoEnumerated     : IntPtr
        InfoAvailable      : IntPtr
        GetLocalInfo       : IntPtr
        GetRemoteInfo      : IntPtr
        GetOriginalInfo    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSyncErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a value indicating the type of sync operation that was being performed when the error was encountered.
     * @returns {OFFLINEFILES_SYNC_OPERATION} Receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_operation">OFFLINEFILES_SYNC_OPERATION</a> enumeration that indicates the operation type.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getsyncoperation
     */
    GetSyncOperation() {
        result := ComCall(5, this, "int*", &pSyncOp := 0, "HRESULT")
        return pSyncOp
    }

    /**
     * Retrieves a value containing a set of flags that describe what changes were encountered during the sync operation associated with the sync error.
     * @returns {Integer} Receives a set of flags describing what changes were encountered during the sync operation.  This parameter can be one or more of the following flag values:
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getitemchangeflags
     */
    GetItemChangeFlags() {
        result := ComCall(6, this, "uint*", &pdwItemChangeFlags := 0, "HRESULT")
        return pdwItemChangeFlags
    }

    /**
     * Indicates whether information was queried for the local, remote, or original copy of the item during synchronization.
     * @param {Pointer<BOOL>} pbLocalEnumerated Receives <b>TRUE</b> if information was queried for the local copy of the item during synchronization, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbRemoteEnumerated Receives <b>TRUE</b> if information was queried for the remote copy of the item during synchronization, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pbOriginalEnumerated Receives <b>TRUE</b> if information was queried for the original copy of the item during synchronization, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-infoenumerated
     */
    InfoEnumerated(pbLocalEnumerated, pbRemoteEnumerated, pbOriginalEnumerated) {
        pbLocalEnumeratedMarshal := pbLocalEnumerated is VarRef ? "int*" : "ptr"
        pbRemoteEnumeratedMarshal := pbRemoteEnumerated is VarRef ? "int*" : "ptr"
        pbOriginalEnumeratedMarshal := pbOriginalEnumerated is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pbLocalEnumeratedMarshal, pbLocalEnumerated, pbRemoteEnumeratedMarshal, pbRemoteEnumerated, pbOriginalEnumeratedMarshal, pbOriginalEnumerated, "HRESULT")
        return result
    }

    /**
     * Indicates whether information was obtained for the local, remote, or original copy of the item during synchronization.
     * @param {Pointer<BOOL>} pbLocalInfo Receives <b>TRUE</b> if information was obtained for the local copy of the item during synchronization, or <b>FALSE</b> otherwise.  If <b>TRUE</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getlocalinfo">GetLocalInfo</a> can be called to retrieve the information.
     * @param {Pointer<BOOL>} pbRemoteInfo Receives <b>TRUE</b> if information was obtained for the remote copy of the item during synchronization, or <b>FALSE</b> otherwise.   If <b>TRUE</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getremoteinfo">GetRemoteInfo</a> can be called to retrieve the information.
     * @param {Pointer<BOOL>} pbOriginalInfo Receives <b>TRUE</b> if information was obtained for the original copy of the item during synchronization, or <b>FALSE</b> otherwise.  If <b>TRUE</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getoriginalinfo">GetOriginalInfo</a> can be called to retrieve the information.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-infoavailable
     */
    InfoAvailable(pbLocalInfo, pbRemoteInfo, pbOriginalInfo) {
        pbLocalInfoMarshal := pbLocalInfo is VarRef ? "int*" : "ptr"
        pbRemoteInfoMarshal := pbRemoteInfo is VarRef ? "int*" : "ptr"
        pbOriginalInfoMarshal := pbOriginalInfo is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pbLocalInfoMarshal, pbLocalInfo, pbRemoteInfoMarshal, pbRemoteInfo, pbOriginalInfoMarshal, pbOriginalInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves an instance of the IOfflineFilesSyncErrorItemInfo interface containing the file times, size, and attributes of the local copy of the item involved in the synchronization.
     * @returns {IOfflineFilesSyncErrorItemInfo} Receives the address of an instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncerroriteminfo">IOfflineFilesSyncErrorItemInfo</a> containing information about the local item copy involved in the synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getlocalinfo
     */
    GetLocalInfo() {
        result := ComCall(9, this, "ptr*", &ppInfo := 0, "HRESULT")
        return IOfflineFilesSyncErrorItemInfo(ppInfo)
    }

    /**
     * Retrieves an instance of the IOfflineFilesSyncErrorItemInfo interface containing the file times, size, and attributes of the remote copy of the item involved in the synchronization.
     * @returns {IOfflineFilesSyncErrorItemInfo} Receives the address of an instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncerroriteminfo">IOfflineFilesSyncErrorItemInfo</a> containing information about the remote item copy involved in the synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getremoteinfo
     */
    GetRemoteInfo() {
        result := ComCall(10, this, "ptr*", &ppInfo := 0, "HRESULT")
        return IOfflineFilesSyncErrorItemInfo(ppInfo)
    }

    /**
     * Retrieves an instance of the IOfflineFilesSyncErrorItemInfo interface containing the file times, size, and attributes of the original copy of the item involved in the synchronization.
     * @returns {IOfflineFilesSyncErrorItemInfo} Receives the address of an instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncerroriteminfo">IOfflineFilesSyncErrorItemInfo</a> containing information about the original item copy involved in the synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getoriginalinfo
     */
    GetOriginalInfo() {
        result := ComCall(11, this, "ptr*", &ppInfo := 0, "HRESULT")
        return IOfflineFilesSyncErrorItemInfo(ppInfo)
    }

    Query(iid) {
        if (IOfflineFilesSyncErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncOperation := CallbackCreate(GetMethod(implObj, "GetSyncOperation"), flags, 2)
        this.vtbl.GetItemChangeFlags := CallbackCreate(GetMethod(implObj, "GetItemChangeFlags"), flags, 2)
        this.vtbl.InfoEnumerated := CallbackCreate(GetMethod(implObj, "InfoEnumerated"), flags, 4)
        this.vtbl.InfoAvailable := CallbackCreate(GetMethod(implObj, "InfoAvailable"), flags, 4)
        this.vtbl.GetLocalInfo := CallbackCreate(GetMethod(implObj, "GetLocalInfo"), flags, 2)
        this.vtbl.GetRemoteInfo := CallbackCreate(GetMethod(implObj, "GetRemoteInfo"), flags, 2)
        this.vtbl.GetOriginalInfo := CallbackCreate(GetMethod(implObj, "GetOriginalInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncOperation)
        CallbackFree(this.vtbl.GetItemChangeFlags)
        CallbackFree(this.vtbl.InfoEnumerated)
        CallbackFree(this.vtbl.InfoAvailable)
        CallbackFree(this.vtbl.GetLocalInfo)
        CallbackFree(this.vtbl.GetRemoteInfo)
        CallbackFree(this.vtbl.GetOriginalInfo)
    }
}
