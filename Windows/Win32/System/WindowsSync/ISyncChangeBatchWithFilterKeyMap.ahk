#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchWithFilterKeyMap extends IUnknown{
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
     * 
     * @param {Pointer<IFilterKeyMap>} ppIFilterKeyMap 
     * @returns {HRESULT} 
     */
    GetFilterKeyMap(ppIFilterKeyMap) {
        result := ComCall(3, this, "ptr", ppIFilterKeyMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFilterKeyMap>} pIFilterKeyMap 
     * @returns {HRESULT} 
     */
    SetFilterKeyMap(pIFilterKeyMap) {
        result := ComCall(4, this, "ptr", pIFilterKeyMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @param {Pointer<ISyncKnowledge>} pFilterForgottenKnowledge 
     * @returns {HRESULT} 
     */
    SetFilterForgottenKnowledge(dwFilterKey, pFilterForgottenKnowledge) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr", pFilterForgottenKnowledge, "int")
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
    GetFilteredReplicaLearnedKnowledge(pDestinationKnowledge, pNewMoveins, ppLearnedForgottenKnowledge) {
        result := ComCall(6, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr", ppLearnedForgottenKnowledge, "int")
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
        result := ComCall(7, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr", ppLearnedFilterForgottenKnowledge, "int")
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
        result := ComCall(8, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr", ppLearnedForgottenKnowledge, "int")
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
        result := ComCall(9, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "ptr", ppLearnedForgottenKnowledge, "int")
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
        result := ComCall(10, this, "ptr", pDestinationKnowledge, "ptr", pNewMoveins, "uint", dwFilterKey, "ptr", ppLearnedFilterForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
