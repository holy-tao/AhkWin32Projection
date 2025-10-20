#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationGroupCollection extends IUnknown{
    /**
     * The interface identifier for IContactAggregationGroupCollection
     * @type {Guid}
     */
    static IID => Guid("{20a19a9c-d2f3-4b83-9143-beffd2cc226d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IContactAggregationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    FindFirst(ppGroup) {
        result := ComCall(3, this, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @param {Pointer<IContactAggregationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    FindFirstByGlobalObjectId(pGlobalObjectId, ppGroup) {
        result := ComCall(4, this, "ptr", pGlobalObjectId, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    FindNext(ppGroup) {
        result := ComCall(5, this, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(6, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
