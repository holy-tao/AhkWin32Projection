#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to an item.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchange
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChange extends IUnknown{
    /**
     * The interface identifier for ISyncChange
     * @type {Guid}
     */
    static IID => Guid("{a1952beb-0f6b-4711-b136-01da85b968a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbReplicaId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetOwnerReplicaId(pbReplicaId, pcbIdSize) {
        result := ComCall(3, this, "char*", pbReplicaId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbRootItemId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetRootItemId(pbRootItemId, pcbIdSize) {
        result := ComCall(4, this, "char*", pbRootItemId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbCurrentReplicaId 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     */
    GetChangeVersion(pbCurrentReplicaId, pVersion) {
        result := ComCall(5, this, "char*", pbCurrentReplicaId, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbCurrentReplicaId 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     */
    GetCreationVersion(pbCurrentReplicaId, pVersion) {
        result := ComCall(6, this, "char*", pbCurrentReplicaId, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pdwFlags) {
        result := ComCall(7, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwWork 
     * @returns {HRESULT} 
     */
    GetWorkEstimate(pdwWork) {
        result := ComCall(8, this, "uint*", pdwWork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSyncChangeUnits>} ppEnum 
     * @returns {HRESULT} 
     */
    GetChangeUnits(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppMadeWithKnowledge 
     * @returns {HRESULT} 
     */
    GetMadeWithKnowledge(ppMadeWithKnowledge) {
        result := ComCall(10, this, "ptr", ppMadeWithKnowledge, "int")
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
        result := ComCall(11, this, "ptr", ppLearnedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwWork 
     * @returns {HRESULT} 
     */
    SetWorkEstimate(dwWork) {
        result := ComCall(12, this, "uint", dwWork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
