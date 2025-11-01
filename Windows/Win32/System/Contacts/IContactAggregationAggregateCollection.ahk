#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationAggregateCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationAggregateCollection
     * @type {Guid}
     */
    static IID => Guid("{2359f3a6-3a68-40af-98db-0f9eb143c3bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindFirstByAntiLinkId", "FindNext", "get_Count"]

    /**
     * 
     * @param {Pointer<IContactAggregationAggregate>} ppAggregate 
     * @returns {HRESULT} 
     */
    FindFirst(ppAggregate) {
        result := ComCall(3, this, "ptr*", ppAggregate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAntiLinkId 
     * @param {Pointer<IContactAggregationAggregate>} ppAggregate 
     * @returns {HRESULT} 
     */
    FindFirstByAntiLinkId(pAntiLinkId, ppAggregate) {
        pAntiLinkId := pAntiLinkId is String ? StrPtr(pAntiLinkId) : pAntiLinkId

        result := ComCall(4, this, "ptr", pAntiLinkId, "ptr*", ppAggregate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationAggregate>} ppAggregate 
     * @returns {HRESULT} 
     */
    FindNext(ppAggregate) {
        result := ComCall(5, this, "ptr*", ppAggregate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pCountMarshal, pCount, "HRESULT")
        return result
    }
}
