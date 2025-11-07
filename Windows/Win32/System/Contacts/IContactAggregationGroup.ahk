#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationAggregateCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationGroup
     * @type {Guid}
     */
    static IID => Guid("{c93c545f-1284-499b-96af-07372af473e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "Add", "Remove", "get_Members", "get_GlobalObjectId", "put_GlobalObjectId", "get_Id", "get_Name", "put_Name"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Add(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Remove(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IContactAggregationAggregateCollection} 
     */
    get_Members() {
        result := ComCall(7, this, "ptr*", &ppAggregateContactCollection := 0, "HRESULT")
        return IContactAggregationAggregateCollection(ppAggregateContactCollection)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GlobalObjectId() {
        pGlobalObjectId := Guid()
        result := ComCall(8, this, "ptr", pGlobalObjectId, "HRESULT")
        return pGlobalObjectId
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {HRESULT} 
     */
    put_GlobalObjectId(pGlobalObjectId) {
        result := ComCall(9, this, "ptr", pGlobalObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(10, this, "ptr*", &ppItemId := 0, "HRESULT")
        return ppItemId
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Name() {
        result := ComCall(11, this, "ptr*", &ppName := 0, "HRESULT")
        return ppName
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    put_Name(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(12, this, "ptr", pName, "HRESULT")
        return result
    }
}
