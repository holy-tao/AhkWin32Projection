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
     * 
     * @param {Pointer<IEnumSyncChanges>} ppEnum 
     * @returns {HRESULT} 
     */
    GetChangeEnumerator(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLastBatch 
     * @returns {HRESULT} 
     */
    GetIsLastBatch(pfLastBatch) {
        result := ComCall(4, this, "ptr", pfLastBatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwWorkForBatch 
     * @returns {HRESULT} 
     */
    GetWorkEstimateForBatch(pdwWorkForBatch) {
        result := ComCall(5, this, "uint*", pdwWorkForBatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRemainingWorkForSession 
     * @returns {HRESULT} 
     */
    GetRemainingWorkEstimateForSession(pdwRemainingWorkForSession) {
        result := ComCall(6, this, "uint*", pdwRemainingWorkForSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbLowerBound 
     * @returns {HRESULT} 
     */
    BeginOrderedGroup(pbLowerBound) {
        result := ComCall(7, this, "char*", pbLowerBound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbUpperBound 
     * @param {Pointer<ISyncKnowledge>} pMadeWithKnowledge 
     * @returns {HRESULT} 
     */
    EndOrderedGroup(pbUpperBound, pMadeWithKnowledge) {
        result := ComCall(8, this, "char*", pbUpperBound, "ptr", pMadeWithKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbOwnerReplicaId 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<SYNC_VERSION>} pChangeVersion 
     * @param {Pointer<SYNC_VERSION>} pCreationVersion 
     * @param {Integer} dwFlags 
     * @param {Integer} dwWorkForChange 
     * @param {Pointer<ISyncChangeBuilder>} ppChangeBuilder 
     * @returns {HRESULT} 
     */
    AddItemMetadataToGroup(pbOwnerReplicaId, pbItemId, pChangeVersion, pCreationVersion, dwFlags, dwWorkForChange, ppChangeBuilder) {
        result := ComCall(9, this, "char*", pbOwnerReplicaId, "char*", pbItemId, "ptr", pChangeVersion, "ptr", pCreationVersion, "uint", dwFlags, "uint", dwWorkForChange, "ptr", ppChangeBuilder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedKnowledge(ppLearnedKnowledge) {
        result := ComCall(10, this, "ptr", ppLearnedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppPrerequisteKnowledge 
     * @returns {HRESULT} 
     */
    GetPrerequisiteKnowledge(ppPrerequisteKnowledge) {
        result := ComCall(11, this, "ptr", ppPrerequisteKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IForgottenKnowledge>} ppSourceForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetSourceForgottenKnowledge(ppSourceForgottenKnowledge) {
        result := ComCall(12, this, "ptr", ppSourceForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetLastBatch() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwWorkForBatch 
     * @returns {HRESULT} 
     */
    SetWorkEstimateForBatch(dwWorkForBatch) {
        result := ComCall(14, this, "uint", dwWorkForBatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRemainingWorkForSession 
     * @returns {HRESULT} 
     */
    SetRemainingWorkEstimateForSession(dwRemainingWorkForSession) {
        result := ComCall(15, this, "uint", dwRemainingWorkForSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbChangeBatch 
     * @param {Pointer<UInt32>} pcbChangeBatch 
     * @returns {HRESULT} 
     */
    Serialize(pbChangeBatch, pcbChangeBatch) {
        result := ComCall(16, this, "char*", pbChangeBatch, "uint*", pcbChangeBatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
