#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationLink.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationLinkCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationLinkCollection
     * @type {Guid}
     */
    static IID => Guid("{f8bc0e93-fb55-4f28-b9fa-b1c274153292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindFirstByRemoteId", "FindNext", "get_Count"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IContactAggregationLink} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteId 
     * @returns {IContactAggregationLink} 
     */
    FindFirstByRemoteId(pSourceType, pAccountId, pRemoteId) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(4, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pRemoteId, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @returns {IContactAggregationLink} 
     */
    FindNext() {
        result := ComCall(5, this, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
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
