#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
        result := ComCall(3, this, "uint*", pdwFilterCount, "HRESULT")
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
        result := ComCall(5, this, "ptr", pfAllChangeUnitsPresent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} ppIFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetFilterForgottenKnowledge(dwFilterKey, ppIFilterForgottenKnowledge) {
        result := ComCall(6, this, "uint", dwFilterKey, "ptr*", ppIFilterForgottenKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledge 
     * @returns {HRESULT} 
     */
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins, ppLearnedKnowledge) {
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", ppLearnedKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} ppLearnedFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedFilterForgottenKnowledge(pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge) {
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", ppLearnedFilterForgottenKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Pointer<ISyncKnowledge>} ppLearnedForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetFilteredReplicaLearnedForgottenKnowledge(pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge) {
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", ppLearnedForgottenKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Pointer<ISyncKnowledge>} ppLearnedForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge) {
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr*", ppLearnedForgottenKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {IEnumItemIds} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} ppLearnedFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge) {
        result := ComCall(11, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr*", ppLearnedFilterForgottenKnowledge, "HRESULT")
        return result
    }
}
