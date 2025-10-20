#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeWithFilterKeyMap extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pdwFilterCount 
     * @returns {HRESULT} 
     */
    GetFilterCount(pdwFilterCount) {
        result := ComCall(3, this, "uint*", pdwFilterCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<SYNC_FILTER_CHANGE>} pFilterChange 
     * @returns {HRESULT} 
     */
    GetFilterChange(dwFilterKey, pFilterChange) {
        result := ComCall(4, this, "uint", dwFilterKey, "ptr", pFilterChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAllChangeUnitsPresent 
     * @returns {HRESULT} 
     */
    GetAllChangeUnitsPresentFlag(pfAllChangeUnitsPresent) {
        result := ComCall(5, this, "ptr", pfAllChangeUnitsPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} ppIFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetFilterForgottenKnowledge(dwFilterKey, ppIFilterForgottenKnowledge) {
        result := ComCall(6, this, "uint", dwFilterKey, "ptr", ppIFilterForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pDestinationKnowledge 
     * @param {Pointer<IEnumItemIds>} pNewMoveins 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledge 
     * @returns {HRESULT} 
     */
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins, ppLearnedKnowledge) {
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr", ppLearnedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pDestinationKnowledge 
     * @param {Pointer<IEnumItemIds>} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} ppLearnedFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedFilterForgottenKnowledge(pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge) {
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr", ppLearnedFilterForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pDestinationKnowledge 
     * @param {Pointer<IEnumItemIds>} pNewMoveins 
     * @param {Pointer<ISyncKnowledge>} ppLearnedForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetFilteredReplicaLearnedForgottenKnowledge(pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge) {
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr", ppLearnedForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pDestinationKnowledge 
     * @param {Pointer<IEnumItemIds>} pNewMoveins 
     * @param {Pointer<ISyncKnowledge>} ppLearnedForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetFilteredReplicaLearnedForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge) {
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr", ppLearnedForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pDestinationKnowledge 
     * @param {Pointer<IEnumItemIds>} pNewMoveins 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} ppLearnedFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedFilterForgottenKnowledgeAfterRecoveryComplete(pDestinationKnowledge, pNewMoveins, dwFilterKey, ppLearnedFilterForgottenKnowledge) {
        result := ComCall(11, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr", ppLearnedFilterForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
