#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationGroup.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationGroupCollection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindFirstByGlobalObjectId", "FindNext", "get_Count"]

    /**
     * 
     * @returns {IContactAggregationGroup} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {IContactAggregationGroup} 
     */
    FindFirstByGlobalObjectId(pGlobalObjectId) {
        result := ComCall(4, this, "ptr", pGlobalObjectId, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
    }

    /**
     * 
     * @returns {IContactAggregationGroup} 
     */
    FindNext() {
        result := ComCall(5, this, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(6, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }
}
