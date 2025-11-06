#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncChangeUnits.ahk
#Include .\ISyncKnowledge.ahk
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
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
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
        pbRootItemIdMarshal := pbRootItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbRootItemIdMarshal, pbRootItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
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
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
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
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getflags
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getworkestimate
     */
    GetWorkEstimate(pdwWork) {
        pdwWorkMarshal := pdwWork is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwWorkMarshal, pdwWork, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSyncChangeUnits} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getchangeunits
     */
    GetChangeUnits() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChangeUnits(ppEnum)
    }

    /**
     * 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getmadewithknowledge
     */
    GetMadeWithKnowledge() {
        result := ComCall(10, this, "ptr*", &ppMadeWithKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppMadeWithKnowledge)
    }

    /**
     * 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchange-getlearnedknowledge
     */
    GetLearnedKnowledge() {
        result := ComCall(11, this, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
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
