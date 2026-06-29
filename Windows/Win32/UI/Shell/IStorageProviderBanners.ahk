#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStorageProviderBanners extends IUnknown {
    /**
     * The interface identifier for IStorageProviderBanners
     * @type {Guid}
     */
    static IID := Guid("{5efb46d7-47c0-4b68-acda-ded47c90ec91}")

    /**
     * The class identifier for StorageProviderBanners
     * @type {Guid}
     */
    static CLSID := Guid("{7ccdf9f4-e576-455a-8bc7-f6ec68d6f063}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStorageProviderBanners interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBanner       : IntPtr
        ClearBanner     : IntPtr
        ClearAllBanners : IntPtr
        GetBanner       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStorageProviderBanners.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} providerIdentity 
     * @param {PWSTR} subscriptionId 
     * @param {PWSTR} contentId 
     * @returns {HRESULT} 
     */
    SetBanner(providerIdentity, subscriptionId, contentId) {
        providerIdentity := providerIdentity is String ? StrPtr(providerIdentity) : providerIdentity
        subscriptionId := subscriptionId is String ? StrPtr(subscriptionId) : subscriptionId
        contentId := contentId is String ? StrPtr(contentId) : contentId

        result := ComCall(3, this, "ptr", providerIdentity, "ptr", subscriptionId, "ptr", contentId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} providerIdentity 
     * @param {PWSTR} subscriptionId 
     * @returns {HRESULT} 
     */
    ClearBanner(providerIdentity, subscriptionId) {
        providerIdentity := providerIdentity is String ? StrPtr(providerIdentity) : providerIdentity
        subscriptionId := subscriptionId is String ? StrPtr(subscriptionId) : subscriptionId

        result := ComCall(4, this, "ptr", providerIdentity, "ptr", subscriptionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} providerIdentity 
     * @returns {HRESULT} 
     */
    ClearAllBanners(providerIdentity) {
        providerIdentity := providerIdentity is String ? StrPtr(providerIdentity) : providerIdentity

        result := ComCall(5, this, "ptr", providerIdentity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} providerIdentity 
     * @param {PWSTR} subscriptionId 
     * @returns {PWSTR} 
     */
    GetBanner(providerIdentity, subscriptionId) {
        providerIdentity := providerIdentity is String ? StrPtr(providerIdentity) : providerIdentity
        subscriptionId := subscriptionId is String ? StrPtr(subscriptionId) : subscriptionId

        result := ComCall(6, this, "ptr", providerIdentity, "ptr", subscriptionId, PWSTR.Ptr, &contentId := 0, "HRESULT")
        return contentId
    }

    Query(iid) {
        if (IStorageProviderBanners.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBanner := CallbackCreate(GetMethod(implObj, "SetBanner"), flags, 4)
        this.vtbl.ClearBanner := CallbackCreate(GetMethod(implObj, "ClearBanner"), flags, 3)
        this.vtbl.ClearAllBanners := CallbackCreate(GetMethod(implObj, "ClearAllBanners"), flags, 2)
        this.vtbl.GetBanner := CallbackCreate(GetMethod(implObj, "GetBanner"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBanner)
        CallbackFree(this.vtbl.ClearBanner)
        CallbackFree(this.vtbl.ClearAllBanners)
        CallbackFree(this.vtbl.GetBanner)
    }
}
