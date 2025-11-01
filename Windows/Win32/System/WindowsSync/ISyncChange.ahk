#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to an item.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchange
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChange
     * @type {Guid}
     */
    static IID => Guid("{a1952beb-0f6b-4711-b136-01da85b968a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwnerReplicaId", "GetRootItemId", "GetChangeVersion", "GetCreationVersion", "GetFlags", "GetWorkEstimate", "GetChangeUnits", "GetMadeWithKnowledge", "GetLearnedKnowledge", "SetWorkEstimate"]

    /**
     * 
     * @param {Pointer<Integer>} pbReplicaId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getownerreplicaid
     */
    GetOwnerReplicaId(pbReplicaId, pcbIdSize) {
        result := ComCall(3, this, "char*", pbReplicaId, "uint*", pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbRootItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getrootitemid
     */
    GetRootItemId(pbRootItemId, pcbIdSize) {
        result := ComCall(4, this, "char*", pbRootItemId, "uint*", pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbCurrentReplicaId 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getchangeversion
     */
    GetChangeVersion(pbCurrentReplicaId, pVersion) {
        result := ComCall(5, this, "char*", pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbCurrentReplicaId 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getcreationversion
     */
    GetCreationVersion(pbCurrentReplicaId, pVersion) {
        result := ComCall(6, this, "char*", pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getflags
     */
    GetFlags(pdwFlags) {
        result := ComCall(7, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getworkestimate
     */
    GetWorkEstimate(pdwWork) {
        result := ComCall(8, this, "uint*", pdwWork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSyncChangeUnits>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getchangeunits
     */
    GetChangeUnits(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppMadeWithKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getmadewithknowledge
     */
    GetMadeWithKnowledge(ppMadeWithKnowledge) {
        result := ComCall(10, this, "ptr*", ppMadeWithKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getlearnedknowledge
     */
    GetLearnedKnowledge(ppLearnedKnowledge) {
        result := ComCall(11, this, "ptr*", ppLearnedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-setworkestimate
     */
    SetWorkEstimate(dwWork) {
        result := ComCall(12, this, "uint", dwWork, "HRESULT")
        return result
    }
}
