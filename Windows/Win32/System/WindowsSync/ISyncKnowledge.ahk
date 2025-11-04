#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents knowledge that a replica has about its item store.
 * @remarks
 * 
  * Be aware that there is no single representation of knowledge. Equivalent knowledge might be represented in different forms and return different values from knowledge inspection methods, such as <b>GetScopeVector</b>, <b>GetRangeExceptions</b>, <b>GetSingleItemExceptions</b>, <b>GetChangeUnitExceptions</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncknowledge
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncKnowledge extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncKnowledge
     * @type {Guid}
     */
    static IID => Guid("{615bbb53-c945-4203-bf4b-2cb65919a0aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwnerReplicaId", "Serialize", "SetLocalTickCount", "ContainsChange", "ContainsChangeUnit", "GetScopeVector", "GetReplicaKeyMap", "Clone", "ConvertVersion", "MapRemoteToLocal", "Union", "ProjectOntoItem", "ProjectOntoChangeUnit", "ProjectOntoRange", "ExcludeItem", "ExcludeChangeUnit", "ContainsKnowledge", "FindMinTickCountForReplica", "GetRangeExceptions", "GetSingleItemExceptions", "GetChangeUnitExceptions", "FindClockVectorForItem", "FindClockVectorForChangeUnit", "GetVersion"]

    /**
     * 
     * @param {Pointer<Integer>} pbReplicaId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-getownerreplicaid
     */
    GetOwnerReplicaId(pbReplicaId, pcbIdSize) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fSerializeReplicaKeyMap 
     * @param {Pointer<Integer>} pbKnowledge 
     * @param {Pointer<Integer>} pcbKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-serialize
     */
    Serialize(fSerializeReplicaKeyMap, pbKnowledge, pcbKnowledge) {
        pbKnowledgeMarshal := pbKnowledge is VarRef ? "char*" : "ptr"
        pcbKnowledgeMarshal := pcbKnowledge is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", fSerializeReplicaKeyMap, pbKnowledgeMarshal, pbKnowledge, pcbKnowledgeMarshal, pcbKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullTickCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-setlocaltickcount
     */
    SetLocalTickCount(ullTickCount) {
        result := ComCall(5, this, "uint", ullTickCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVersionOwnerReplicaId 
     * @param {Pointer<Integer>} pgidItemId 
     * @param {Pointer<SYNC_VERSION>} pSyncVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-containschange
     */
    ContainsChange(pbVersionOwnerReplicaId, pgidItemId, pSyncVersion) {
        pbVersionOwnerReplicaIdMarshal := pbVersionOwnerReplicaId is VarRef ? "char*" : "ptr"
        pgidItemIdMarshal := pgidItemId is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbVersionOwnerReplicaIdMarshal, pbVersionOwnerReplicaId, pgidItemIdMarshal, pgidItemId, "ptr", pSyncVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVersionOwnerReplicaId 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @param {Pointer<SYNC_VERSION>} pSyncVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-containschangeunit
     */
    ContainsChangeUnit(pbVersionOwnerReplicaId, pbItemId, pbChangeUnitId, pSyncVersion) {
        pbVersionOwnerReplicaIdMarshal := pbVersionOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pbVersionOwnerReplicaIdMarshal, pbVersionOwnerReplicaId, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr", pSyncVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-getscopevector
     */
    GetScopeVector(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IReplicaKeyMap>} ppReplicaKeyMap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-getreplicakeymap
     */
    GetReplicaKeyMap(ppReplicaKeyMap) {
        result := ComCall(9, this, "ptr*", ppReplicaKeyMap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppClonedKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-clone
     */
    Clone(ppClonedKnowledge) {
        result := ComCall(10, this, "ptr*", ppClonedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pKnowledgeIn 
     * @param {Pointer<Integer>} pbCurrentOwnerId 
     * @param {Pointer<SYNC_VERSION>} pVersionIn 
     * @param {Pointer<Integer>} pbNewOwnerId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @param {Pointer<SYNC_VERSION>} pVersionOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-convertversion
     */
    ConvertVersion(pKnowledgeIn, pbCurrentOwnerId, pVersionIn, pbNewOwnerId, pcbIdSize, pVersionOut) {
        pbCurrentOwnerIdMarshal := pbCurrentOwnerId is VarRef ? "char*" : "ptr"
        pbNewOwnerIdMarshal := pbNewOwnerId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pKnowledgeIn, pbCurrentOwnerIdMarshal, pbCurrentOwnerId, "ptr", pVersionIn, pbNewOwnerIdMarshal, pbNewOwnerId, pcbIdSizeMarshal, pcbIdSize, "ptr", pVersionOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pRemoteKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppMappedKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-mapremotetolocal
     */
    MapRemoteToLocal(pRemoteKnowledge, ppMappedKnowledge) {
        result := ComCall(12, this, "ptr", pRemoteKnowledge, "ptr*", ppMappedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-union
     */
    Union(pKnowledge) {
        result := ComCall(13, this, "ptr", pKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<ISyncKnowledge>} ppKnowledgeOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-projectontoitem
     */
    ProjectOntoItem(pbItemId, ppKnowledgeOut) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, pbItemIdMarshal, pbItemId, "ptr*", ppKnowledgeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @param {Pointer<ISyncKnowledge>} ppKnowledgeOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-projectontochangeunit
     */
    ProjectOntoChangeUnit(pbItemId, pbChangeUnitId, ppKnowledgeOut) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr*", ppKnowledgeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYNC_RANGE>} psrngSyncRange 
     * @param {Pointer<ISyncKnowledge>} ppKnowledgeOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-projectontorange
     */
    ProjectOntoRange(psrngSyncRange, ppKnowledgeOut) {
        result := ComCall(16, this, "ptr", psrngSyncRange, "ptr*", ppKnowledgeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-excludeitem
     */
    ExcludeItem(pbItemId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, pbItemIdMarshal, pbItemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-excludechangeunit
     */
    ExcludeChangeUnit(pbItemId, pbChangeUnitId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-containsknowledge
     */
    ContainsKnowledge(pKnowledge) {
        result := ComCall(19, this, "ptr", pKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbReplicaId 
     * @param {Pointer<Integer>} pullReplicaTickCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-findmintickcountforreplica
     */
    FindMinTickCountForReplica(pbReplicaId, pullReplicaTickCount) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pullReplicaTickCountMarshal := pullReplicaTickCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pbReplicaIdMarshal, pbReplicaId, pullReplicaTickCountMarshal, pullReplicaTickCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-getrangeexceptions
     */
    GetRangeExceptions(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-getsingleitemexceptions
     */
    GetSingleItemExceptions(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-getchangeunitexceptions
     */
    GetChangeUnitExceptions(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-findclockvectorforitem
     */
    FindClockVectorForItem(pbItemId, riid, ppUnk) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, pbItemIdMarshal, pbItemId, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncknowledge-findclockvectorforchangeunit
     */
    FindClockVectorForChangeUnit(pbItemId, pbChangeUnitId, riid, ppUnk) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(25, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }
}
