#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDENTITY_TYPE.ahk" { IDENTITY_TYPE }
#Import "..\..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IIdentityAdvise.ahk" { IIdentityAdvise }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct AsyncIIdentityProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIIdentityProvider
     * @type {Guid}
     */
    static IID := Guid("{c6fc9901-c433-4646-8f48-4e4687aae2a0}")

    /**
     * The class identifier for AsyncIIdentityProvider
     * @type {Guid}
     */
    static CLSID := Guid("{c6fc9901-c433-4646-8f48-4e4687aae2a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIIdentityProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_GetIdentityEnum           : IntPtr
        Finish_GetIdentityEnum          : IntPtr
        Begin_Create                    : IntPtr
        Finish_Create                   : IntPtr
        Begin_Import                    : IntPtr
        Finish_Import                   : IntPtr
        Begin_Delete                    : IntPtr
        Finish_Delete                   : IntPtr
        Begin_FindByUniqueID            : IntPtr
        Finish_FindByUniqueID           : IntPtr
        Begin_GetProviderPropertyStore  : IntPtr
        Finish_GetProviderPropertyStore : IntPtr
        Begin_Advise                    : IntPtr
        Finish_Advise                   : IntPtr
        Begin_UnAdvise                  : IntPtr
        Finish_UnAdvise                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIIdentityProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDENTITY_TYPE} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @returns {HRESULT} 
     */
    Begin_GetIdentityEnum(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(3, this, IDENTITY_TYPE, eIdentityType, PROPERTYKEY.Ptr, pFilterkey, PROPVARIANT.Ptr, pFilterPropVarValue, "HRESULT")
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

        result := ComCall(5, this, "ptr", lpszUserName, PROPVARIANT.Ptr, pKeywordsToAdd, "HRESULT")
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

        result := ComCall(9, this, "ptr", lpszUniqueID, PROPVARIANT.Ptr, pKeywordsToDelete, "HRESULT")
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

    Query(iid) {
        if (AsyncIIdentityProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_GetIdentityEnum := CallbackCreate(GetMethod(implObj, "Begin_GetIdentityEnum"), flags, 4)
        this.vtbl.Finish_GetIdentityEnum := CallbackCreate(GetMethod(implObj, "Finish_GetIdentityEnum"), flags, 2)
        this.vtbl.Begin_Create := CallbackCreate(GetMethod(implObj, "Begin_Create"), flags, 3)
        this.vtbl.Finish_Create := CallbackCreate(GetMethod(implObj, "Finish_Create"), flags, 2)
        this.vtbl.Begin_Import := CallbackCreate(GetMethod(implObj, "Begin_Import"), flags, 2)
        this.vtbl.Finish_Import := CallbackCreate(GetMethod(implObj, "Finish_Import"), flags, 1)
        this.vtbl.Begin_Delete := CallbackCreate(GetMethod(implObj, "Begin_Delete"), flags, 3)
        this.vtbl.Finish_Delete := CallbackCreate(GetMethod(implObj, "Finish_Delete"), flags, 1)
        this.vtbl.Begin_FindByUniqueID := CallbackCreate(GetMethod(implObj, "Begin_FindByUniqueID"), flags, 2)
        this.vtbl.Finish_FindByUniqueID := CallbackCreate(GetMethod(implObj, "Finish_FindByUniqueID"), flags, 2)
        this.vtbl.Begin_GetProviderPropertyStore := CallbackCreate(GetMethod(implObj, "Begin_GetProviderPropertyStore"), flags, 1)
        this.vtbl.Finish_GetProviderPropertyStore := CallbackCreate(GetMethod(implObj, "Finish_GetProviderPropertyStore"), flags, 2)
        this.vtbl.Begin_Advise := CallbackCreate(GetMethod(implObj, "Begin_Advise"), flags, 3)
        this.vtbl.Finish_Advise := CallbackCreate(GetMethod(implObj, "Finish_Advise"), flags, 2)
        this.vtbl.Begin_UnAdvise := CallbackCreate(GetMethod(implObj, "Begin_UnAdvise"), flags, 2)
        this.vtbl.Finish_UnAdvise := CallbackCreate(GetMethod(implObj, "Finish_UnAdvise"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_GetIdentityEnum)
        CallbackFree(this.vtbl.Finish_GetIdentityEnum)
        CallbackFree(this.vtbl.Begin_Create)
        CallbackFree(this.vtbl.Finish_Create)
        CallbackFree(this.vtbl.Begin_Import)
        CallbackFree(this.vtbl.Finish_Import)
        CallbackFree(this.vtbl.Begin_Delete)
        CallbackFree(this.vtbl.Finish_Delete)
        CallbackFree(this.vtbl.Begin_FindByUniqueID)
        CallbackFree(this.vtbl.Finish_FindByUniqueID)
        CallbackFree(this.vtbl.Begin_GetProviderPropertyStore)
        CallbackFree(this.vtbl.Finish_GetProviderPropertyStore)
        CallbackFree(this.vtbl.Begin_Advise)
        CallbackFree(this.vtbl.Finish_Advise)
        CallbackFree(this.vtbl.Begin_UnAdvise)
        CallbackFree(this.vtbl.Finish_UnAdvise)
    }
}
