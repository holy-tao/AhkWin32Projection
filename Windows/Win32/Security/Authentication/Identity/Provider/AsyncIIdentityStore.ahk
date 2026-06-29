#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDENTITY_TYPE.ahk" { IDENTITY_TYPE }
#Import "..\..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct AsyncIIdentityStore extends IUnknown {
    /**
     * The interface identifier for AsyncIIdentityStore
     * @type {Guid}
     */
    static IID := Guid("{eefa1616-48de-4872-aa64-6e6206535a51}")

    /**
     * The class identifier for AsyncIIdentityStore
     * @type {Guid}
     */
    static CLSID := Guid("{eefa1616-48de-4872-aa64-6e6206535a51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIIdentityStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_GetCount             : IntPtr
        Finish_GetCount            : IntPtr
        Begin_GetAt                : IntPtr
        Finish_GetAt               : IntPtr
        Begin_AddToCache           : IntPtr
        Finish_AddToCache          : IntPtr
        Begin_ConvertToSid         : IntPtr
        Finish_ConvertToSid        : IntPtr
        Begin_EnumerateIdentities  : IntPtr
        Finish_EnumerateIdentities : IntPtr
        Begin_Reset                : IntPtr
        Finish_Reset               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIIdentityStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_GetCount() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_GetCount() {
        result := ComCall(4, this, "uint*", &pdwProviders := 0, "HRESULT")
        return pdwProviders
    }

    /**
     * 
     * @param {Integer} dwProvider 
     * @param {Pointer<Guid>} pProvGuid 
     * @returns {HRESULT} 
     */
    Begin_GetAt(dwProvider, pProvGuid) {
        result := ComCall(5, this, "uint", dwProvider, Guid.Ptr, pProvGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pProvGuid 
     * @returns {IUnknown} 
     */
    Finish_GetAt(pProvGuid) {
        result := ComCall(6, this, Guid.Ptr, pProvGuid, "ptr*", &ppIdentityProvider := 0, "HRESULT")
        return IUnknown(ppIdentityProvider)
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    Begin_AddToCache(lpszUniqueID, ProviderGUID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", lpszUniqueID, Guid.Ptr, ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_AddToCache() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @param {Integer} cbSid 
     * @param {Pointer<Integer>} _pSid 
     * @returns {HRESULT} 
     */
    Begin_ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, _pSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        _pSidMarshal := _pSid is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "ptr", lpszUniqueID, Guid.Ptr, ProviderGUID, "ushort", cbSid, _pSidMarshal, _pSid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} _pSid 
     * @returns {Integer} 
     */
    Finish_ConvertToSid(_pSid) {
        _pSidMarshal := _pSid is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, _pSidMarshal, _pSid, "ushort*", &pcbRequiredSid := 0, "HRESULT")
        return pcbRequiredSid
    }

    /**
     * 
     * @param {IDENTITY_TYPE} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @returns {HRESULT} 
     */
    Begin_EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(11, this, IDENTITY_TYPE, eIdentityType, PROPERTYKEY.Ptr, pFilterkey, PROPVARIANT.Ptr, pFilterPropVarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    Finish_EnumerateIdentities() {
        result := ComCall(12, this, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_Reset() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Reset() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIIdentityStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_GetCount := CallbackCreate(GetMethod(implObj, "Begin_GetCount"), flags, 1)
        this.vtbl.Finish_GetCount := CallbackCreate(GetMethod(implObj, "Finish_GetCount"), flags, 2)
        this.vtbl.Begin_GetAt := CallbackCreate(GetMethod(implObj, "Begin_GetAt"), flags, 3)
        this.vtbl.Finish_GetAt := CallbackCreate(GetMethod(implObj, "Finish_GetAt"), flags, 3)
        this.vtbl.Begin_AddToCache := CallbackCreate(GetMethod(implObj, "Begin_AddToCache"), flags, 3)
        this.vtbl.Finish_AddToCache := CallbackCreate(GetMethod(implObj, "Finish_AddToCache"), flags, 1)
        this.vtbl.Begin_ConvertToSid := CallbackCreate(GetMethod(implObj, "Begin_ConvertToSid"), flags, 5)
        this.vtbl.Finish_ConvertToSid := CallbackCreate(GetMethod(implObj, "Finish_ConvertToSid"), flags, 3)
        this.vtbl.Begin_EnumerateIdentities := CallbackCreate(GetMethod(implObj, "Begin_EnumerateIdentities"), flags, 4)
        this.vtbl.Finish_EnumerateIdentities := CallbackCreate(GetMethod(implObj, "Finish_EnumerateIdentities"), flags, 2)
        this.vtbl.Begin_Reset := CallbackCreate(GetMethod(implObj, "Begin_Reset"), flags, 1)
        this.vtbl.Finish_Reset := CallbackCreate(GetMethod(implObj, "Finish_Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_GetCount)
        CallbackFree(this.vtbl.Finish_GetCount)
        CallbackFree(this.vtbl.Begin_GetAt)
        CallbackFree(this.vtbl.Finish_GetAt)
        CallbackFree(this.vtbl.Begin_AddToCache)
        CallbackFree(this.vtbl.Finish_AddToCache)
        CallbackFree(this.vtbl.Begin_ConvertToSid)
        CallbackFree(this.vtbl.Finish_ConvertToSid)
        CallbackFree(this.vtbl.Begin_EnumerateIdentities)
        CallbackFree(this.vtbl.Finish_EnumerateIdentities)
        CallbackFree(this.vtbl.Begin_Reset)
        CallbackFree(this.vtbl.Finish_Reset)
    }
}
