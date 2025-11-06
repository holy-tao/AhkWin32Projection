#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeWithFilterKeyMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeWithFilterKeyMap
     * @type {Guid}
     */
    static IID => Guid("{bfe1ef00-e87d-42fd-a4e9-242d70414aef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilterCount", "GetFilterChange", "GetAllChangeUnitsPresentFlag", "GetFilterForgottenKnowledge", "GetFilteredReplicaLearnedKnowledge", "GetLearnedFilterForgottenKnowledge", "GetFilteredReplicaLearnedForgottenKnowledge", "GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete", "GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFilterCount 
     * @returns {HRESULT} 
     */
    GetFilterCount(pdwFilterCount) {
        pdwFilterCountMarshal := pdwFilterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFilterCountMarshal, pdwFilterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<SYNC_FILTER_CHANGE>} pFilterChange 
     * @returns {HRESULT} 
     */
    GetFilterChange(dwFilterKey, pFilterChange) {
        result := ComCall(4, this, "uint", dwFilterKey, "ptr", pFilterChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllChangeUnitsPresent 
     * @returns {HRESULT} 
     */
    GetAllChangeUnitsPresentFlag(pfAllChangeUnitsPresent) {
        pfAllChangeUnitsPresentMarshal := pfAllChangeUnitsPresent is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pfAllChangeUnitsPresentMarshal, pfAllChangeUnitsPresent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetFilterForgottenKnowledge(dwFilterKey) {
        result := ComCall(6, this, "uint", dwFilterKey, "ptr*", &ppIFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppIFilterForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncKnowledge} 
     */
    GetLearnedFilterForgottenKnowledge(pDestinationKnowledge, pNewMoveins, dwFilterKey) {
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledge(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedForgottenKnowledge)
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @returns {ISyncKnowledge} 
     */
    GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins) {
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
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
        result := ComCall(11, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", &ppLearnedFilterForgottenKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedFilterForgottenKnowledge)
    }
}
