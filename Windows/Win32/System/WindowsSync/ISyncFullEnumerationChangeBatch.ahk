#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeBatchBase.ahk

/**
 * Represents the metadata for a set of changes that is created as part of a recovery synchronization.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncfullenumerationchangebatch
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFullEnumerationChangeBatch extends ISyncChangeBatchBase{
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
     * 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledgeAfterRecoveryComplete 
     * @returns {HRESULT} 
     */
    GetLearnedKnowledgeAfterRecoveryComplete(ppLearnedKnowledgeAfterRecoveryComplete) {
        result := ComCall(17, this, "ptr", ppLearnedKnowledgeAfterRecoveryComplete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbClosedLowerBoundItemId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetClosedLowerBoundItemId(pbClosedLowerBoundItemId, pcbIdSize) {
        result := ComCall(18, this, "char*", pbClosedLowerBoundItemId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbClosedUpperBoundItemId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetClosedUpperBoundItemId(pbClosedUpperBoundItemId, pcbIdSize) {
        result := ComCall(19, this, "char*", pbClosedUpperBoundItemId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
