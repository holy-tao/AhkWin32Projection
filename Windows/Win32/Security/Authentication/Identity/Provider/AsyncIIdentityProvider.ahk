#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{c6fc9901-c433-4646-8f48-4e4687aae2a0}")

    /**
     * The class identifier for AsyncIIdentityProvider
     * @type {Guid}
     */
    static CLSID => Guid("{c6fc9901-c433-4646-8f48-4e4687aae2a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_GetIdentityEnum", "Finish_GetIdentityEnum", "Begin_Create", "Finish_Create", "Begin_Import", "Finish_Import", "Begin_Delete", "Finish_Delete", "Begin_FindByUniqueID", "Finish_FindByUniqueID", "Begin_GetProviderPropertyStore", "Finish_GetProviderPropertyStore", "Begin_Advise", "Finish_Advise", "Begin_UnAdvise", "Finish_UnAdvise"]

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @returns {HRESULT} 
     */
    Begin_GetIdentityEnum(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(3, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    Finish_GetIdentityEnum() {
        result := ComCall(4, this, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * 
     * @param {PWSTR} lpszUserName 
     * @param {Pointer<PROPVARIANT>} pKeywordsToAdd 
     * @returns {HRESULT} 
     */
    Begin_Create(lpszUserName, pKeywordsToAdd) {
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName

        result := ComCall(5, this, "ptr", lpszUserName, "ptr", pKeywordsToAdd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStore} 
     */
    Finish_Create() {
        result := ComCall(6, this, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @param {IPropertyStore} pPropertyStore 
     * @returns {HRESULT} 
     */
    Begin_Import(pPropertyStore) {
        result := ComCall(7, this, "ptr", pPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Import() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<PROPVARIANT>} pKeywordsToDelete 
     * @returns {HRESULT} 
     */
    Begin_Delete(lpszUniqueID, pKeywordsToDelete) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(9, this, "ptr", lpszUniqueID, "ptr", pKeywordsToDelete, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    Begin_FindByUniqueID(lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(11, this, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStore} 
     */
    Finish_FindByUniqueID() {
        result := ComCall(12, this, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_GetProviderPropertyStore() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStore} 
     */
    Finish_GetProviderPropertyStore() {
        result := ComCall(14, this, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @param {IIdentityAdvise} pIdentityAdvise 
     * @param {Integer} dwIdentityUpdateEvents 
     * @returns {HRESULT} 
     */
    Begin_Advise(pIdentityAdvise, dwIdentityUpdateEvents) {
        result := ComCall(15, this, "ptr", pIdentityAdvise, "uint", dwIdentityUpdateEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_Advise() {
        result := ComCall(16, this, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Begin_UnAdvise(dwCookie) {
        result := ComCall(17, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_UnAdvise() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
