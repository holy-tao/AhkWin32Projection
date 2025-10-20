#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IEnumSyncChanges>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getchangeenumerator
     */
    GetChangeEnumerator(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLastBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getislastbatch
     */
    GetIsLastBatch(pfLastBatch) {
        result := ComCall(4, this, "ptr", pfLastBatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWorkForBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getworkestimateforbatch
     */
    GetWorkEstimateForBatch(pdwWorkForBatch) {
        result := ComCall(5, this, "uint*", pdwWorkForBatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRemainingWorkForSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getremainingworkestimateforsession
     */
    GetRemainingWorkEstimateForSession(pdwRemainingWorkForSession) {
        result := ComCall(6, this, "uint*", pdwRemainingWorkForSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLowerBound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-beginorderedgroup
     */
    BeginOrderedGroup(pbLowerBound) {
        result := ComCall(7, this, "char*", pbLowerBound, "HRESULT")
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
        result := ComCall(8, this, "char*", pbUpperBound, "ptr", pMadeWithKnowledge, "HRESULT")
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
     * @param {Pointer<ISyncChangeBuilder>} ppChangeBuilder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-additemmetadatatogroup
     */
    AddItemMetadataToGroup(pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder) {
        result := ComCall(9, this, "char*", pbOwnerReplicaId, "char*", pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwFlags, "uint", dwWorkForChange, "ptr*", ppChangeBuilder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getlearnedknowledge
     */
    GetLearnedKnowledge(ppLearnedKnowledge) {
        result := ComCall(10, this, "ptr*", ppLearnedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppPrerequisteKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getprerequisiteknowledge
     */
    GetPrerequisiteKnowledge(ppPrerequisteKnowledge) {
        result := ComCall(11, this, "ptr*", ppPrerequisteKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IForgottenKnowledge>} ppSourceForgottenKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase-getsourceforgottenknowledge
     */
    GetSourceForgottenKnowledge(ppSourceForgottenKnowledge) {
        result := ComCall(12, this, "ptr*", ppSourceForgottenKnowledge, "HRESULT")
        return result
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
        result := ComCall(16, this, "char*", pbChangeBatch, "uint*", pcbChangeBatch, "HRESULT")
        return result
    }
}
