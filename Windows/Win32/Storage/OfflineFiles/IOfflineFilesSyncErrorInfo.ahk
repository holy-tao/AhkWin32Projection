#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pSyncOp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getsyncoperation
     */
    GetSyncOperation(pSyncOp) {
        result := ComCall(5, this, "int*", pSyncOp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwItemChangeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getitemchangeflags
     */
    GetItemChangeFlags(pdwItemChangeFlags) {
        result := ComCall(6, this, "uint*", pdwItemChangeFlags, "HRESULT")
        return result
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
        result := ComCall(7, this, "ptr", pbLocalEnumerated, "ptr", pbRemoteEnumerated, "ptr", pbOriginalEnumerated, "HRESULT")
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
        result := ComCall(8, this, "ptr", pbLocalInfo, "ptr", pbRemoteInfo, "ptr", pbOriginalInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOfflineFilesSyncErrorItemInfo>} ppInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getlocalinfo
     */
    GetLocalInfo(ppInfo) {
        result := ComCall(9, this, "ptr*", ppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOfflineFilesSyncErrorItemInfo>} ppInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getremoteinfo
     */
    GetRemoteInfo(ppInfo) {
        result := ComCall(10, this, "ptr*", ppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOfflineFilesSyncErrorItemInfo>} ppInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncerrorinfo-getoriginalinfo
     */
    GetOriginalInfo(ppInfo) {
        result := ComCall(11, this, "ptr*", ppInfo, "HRESULT")
        return result
    }
}
