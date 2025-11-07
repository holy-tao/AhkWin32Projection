#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncChanges.ahk
#Include .\ISyncChangeBuilder.ahk
#Include .\ISyncKnowledge.ahk
#Include .\IForgottenKnowledge.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents metadata for a set of changes.
 * @remarks
 * 
 * <b>ISyncChangeBatchBase</b> is the base interface for change batches. Typically, it is overridden by a derived interface, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> for a knowledge synchronization, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncfullenumerationchangebatch">ISyncFullEnumerationChangeBatch</a> for a full enumeration synchronization.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchbase
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchBase
     * @type {Guid}
     */
    static IID => Guid("{52f6e694-6a71-4494-a184-a8311bf5d227}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChangeEnumerator", "GetIsLastBatch", "GetWorkEstimateForBatch", "GetRemainingWorkEstimateForSession", "BeginOrderedGroup", "EndOrderedGroup", "AddItemMetadataToGroup", "GetLearnedKnowledge", "GetPrerequisiteKnowledge", "GetSourceForgottenKnowledge", "SetLastBatch", "SetWorkEstimateForBatch", "SetRemainingWorkEstimateForSession", "Serialize"]

    /**
     * 
     * @returns {IEnumSyncChanges} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getchangeenumerator
     */
    GetChangeEnumerator() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChanges(ppEnum)
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLastBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getislastbatch
     */
    GetIsLastBatch(pfLastBatch) {
        pfLastBatchMarshal := pfLastBatch is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pfLastBatchMarshal, pfLastBatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWorkForBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getworkestimateforbatch
     */
    GetWorkEstimateForBatch(pdwWorkForBatch) {
        pdwWorkForBatchMarshal := pdwWorkForBatch is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwWorkForBatchMarshal, pdwWorkForBatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRemainingWorkForSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getremainingworkestimateforsession
     */
    GetRemainingWorkEstimateForSession(pdwRemainingWorkForSession) {
        pdwRemainingWorkForSessionMarshal := pdwRemainingWorkForSession is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwRemainingWorkForSessionMarshal, pdwRemainingWorkForSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLowerBound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-beginorderedgroup
     */
    BeginOrderedGroup(pbLowerBound) {
        pbLowerBoundMarshal := pbLowerBound is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pbLowerBoundMarshal, pbLowerBound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbUpperBound 
     * @param {ISyncKnowledge} pMadeWithKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-endorderedgroup
     */
    EndOrderedGroup(pbUpperBound, pMadeWithKnowledge) {
        pbUpperBoundMarshal := pbUpperBound is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbUpperBoundMarshal, pbUpperBound, "ptr", pMadeWithKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbOwnerReplicaId 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<SYNC_VERSION>} pChangeVersion 
     * @param {Pointer<SYNC_VERSION>} pCreationVersion 
     * @param {Integer} dwFlags 
     * @param {Integer} dwWorkForChange 
     * @returns {ISyncChangeBuilder} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-additemmetadatatogroup
     */
    AddItemMetadataToGroup(pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange) {
        pbOwnerReplicaIdMarshal := pbOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pbOwnerReplicaIdMarshal, pbOwnerReplicaId, pbItemIdMarshal, pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwFlags, "uint", dwWorkForChange, "ptr*", &ppChangeBuilder := 0, "HRESULT")
        return ISyncChangeBuilder(ppChangeBuilder)
    }

    /**
     * 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getlearnedknowledge
     */
    GetLearnedKnowledge() {
        result := ComCall(10, this, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getprerequisiteknowledge
     */
    GetPrerequisiteKnowledge() {
        result := ComCall(11, this, "ptr*", &ppPrerequisteKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppPrerequisteKnowledge)
    }

    /**
     * 
     * @returns {IForgottenKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getsourceforgottenknowledge
     */
    GetSourceForgottenKnowledge() {
        result := ComCall(12, this, "ptr*", &ppSourceForgottenKnowledge := 0, "HRESULT")
        return IForgottenKnowledge(ppSourceForgottenKnowledge)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-setlastbatch
     */
    SetLastBatch() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWorkForBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-setworkestimateforbatch
     */
    SetWorkEstimateForBatch(dwWorkForBatch) {
        result := ComCall(14, this, "uint", dwWorkForBatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRemainingWorkForSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-setremainingworkestimateforsession
     */
    SetRemainingWorkEstimateForSession(dwRemainingWorkForSession) {
        result := ComCall(15, this, "uint", dwRemainingWorkForSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbChangeBatch 
     * @param {Pointer<Integer>} pcbChangeBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-serialize
     */
    Serialize(pbChangeBatch, pcbChangeBatch) {
        pbChangeBatchMarshal := pbChangeBatch is VarRef ? "char*" : "ptr"
        pcbChangeBatchMarshal := pcbChangeBatch is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pbChangeBatchMarshal, pbChangeBatch, pcbChangeBatchMarshal, pcbChangeBatch, "HRESULT")
        return result
    }
}
