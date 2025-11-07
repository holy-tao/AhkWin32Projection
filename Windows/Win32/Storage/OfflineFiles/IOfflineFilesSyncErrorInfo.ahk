#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesSyncErrorItemInfo.ahk
#Include .\IOfflineFilesErrorInfo.ahk

/**
 * Supplied with the IOfflineFilesSyncProgress::SyncItemResult method to communicate details about the item that experienced a sync error.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessyncerrorinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSyncErrorInfo extends IOfflineFilesErrorInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesSyncErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{59f95e46-eb54-49d1-be76-de95458d01b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncOperation", "GetItemChangeFlags", "InfoEnumerated", "InfoAvailable", "GetLocalInfo", "GetRemoteInfo", "GetOriginalInfo"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getsyncoperation
     */
    GetSyncOperation() {
        result := ComCall(5, this, "int*", &pSyncOp := 0, "HRESULT")
        return pSyncOp
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getitemchangeflags
     */
    GetItemChangeFlags() {
        result := ComCall(6, this, "uint*", &pdwItemChangeFlags := 0, "HRESULT")
        return pdwItemChangeFlags
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLocalEnumerated 
     * @param {Pointer<BOOL>} pbRemoteEnumerated 
     * @param {Pointer<BOOL>} pbOriginalEnumerated 
     * @returns {HRESULT} 
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
     * 
     * @param {Pointer<BOOL>} pbLocalInfo 
     * @param {Pointer<BOOL>} pbRemoteInfo 
     * @param {Pointer<BOOL>} pbOriginalInfo 
     * @returns {HRESULT} 
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
     * 
     * @returns {IOfflineFilesSyncErrorItemInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getlocalinfo
     */
    GetLocalInfo() {
        result := ComCall(9, this, "ptr*", &ppInfo := 0, "HRESULT")
        return IOfflineFilesSyncErrorItemInfo(ppInfo)
    }

    /**
     * 
     * @returns {IOfflineFilesSyncErrorItemInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getremoteinfo
     */
    GetRemoteInfo() {
        result := ComCall(10, this, "ptr*", &ppInfo := 0, "HRESULT")
        return IOfflineFilesSyncErrorItemInfo(ppInfo)
    }

    /**
     * 
     * @returns {IOfflineFilesSyncErrorItemInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getoriginalinfo
     */
    GetOriginalInfo() {
        result := ComCall(11, this, "ptr*", &ppInfo := 0, "HRESULT")
        return IOfflineFilesSyncErrorItemInfo(ppInfo)
    }
}
