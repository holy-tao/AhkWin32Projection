#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFilterKeyMap.ahk
#Include .\ISyncKnowledge.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchWithFilterKeyMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchWithFilterKeyMap
     * @type {Guid}
     */
    static IID => Guid("{de247002-566d-459a-a6ed-a5aab3459fb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilterKeyMap", "SetFilterKeyMap", "SetFilterForgottenKnowledge", "GetFilteredReplicaLearnedKnowledge", "GetLearnedFilterForgottenKnowledge", "GetFilteredReplicaLearnedForgottenKnowledge", "GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete", "GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete"]

    /**
     * 
     * @returns {IFilterKeyMap} 
     */
    GetFilterKeyMap() {
        result := ComCall(3, this, "ptr*", &ppIFilterKeyMap := 0, "HRESULT")
        return IFilterKeyMap(ppIFilterKeyMap)
    }

    /**
     * 
     * @param {IFilterKeyMap} pIFilterKeyMap 
     * @returns {HRESULT} 
     */
    SetFilterKeyMap(pIFilterKeyMap) {
        result := ComCall(4, this, "ptr", pIFilterKeyMap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {ISyncKnowledge} pFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    SetFilterForgottenKnowledge(dwFilterKey, pFilterForgottenKnowledge) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr", pFilterForgottenKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(6, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetLearnedFilterForgottenKnowledge(pDestinationKnowledge, pNewMoveins, dwFilterKey) {
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins, dwFilterKey) {
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }
}
