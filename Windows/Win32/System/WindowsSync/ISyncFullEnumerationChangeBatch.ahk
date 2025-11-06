#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk
#Include .\ISyncChangeBatchBase.ahk

/**
 * Represents the metadata for a set of changes that is created as part of a recovery synchronization.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncfullenumerationchangebatch
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFullEnumerationChangeBatch extends ISyncChangeBatchBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncFullEnumerationChangeBatch
     * @type {Guid}
     */
    static IID => Guid("{ef64197d-4f44-4ea2-b355-4524713e3bed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLearnedKnowledgeAfterRecoveryComplete", "GetClosedLowerBoundItemId", "GetClosedUpperBoundItemId"]

    /**
     * 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchangebatch-getlearnedknowledgeafterrecoverycomplete
     */
    GetLearnedKnowledgeAfterRecoveryComplete() {
        result := ComCall(17, this, "ptr*", &ppLearnedKnowledgeAfterRecoveryComplete := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledgeAfterRecoveryComplete)
    }

    /**
     * 
     * @param {Pointer<Integer>} pbClosedLowerBoundItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchangebatch-getclosedlowerbounditemid
     */
    GetClosedLowerBoundItemId(pbClosedLowerBoundItemId, pcbIdSize) {
        pbClosedLowerBoundItemIdMarshal := pbClosedLowerBoundItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, pbClosedLowerBoundItemIdMarshal, pbClosedLowerBoundItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbClosedUpperBoundItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchangebatch-getclosedupperbounditemid
     */
    GetClosedUpperBoundItemId(pbClosedUpperBoundItemId, pcbIdSize) {
        pbClosedUpperBoundItemIdMarshal := pbClosedUpperBoundItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pbClosedUpperBoundItemIdMarshal, pbClosedUpperBoundItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }
}
