#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderBanners extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderBanners
     * @type {Guid}
     */
    static IID => Guid("{5efb46d7-47c0-4b68-acda-ded47c90ec91}")

    /**
     * The class identifier for StorageProviderBanners
     * @type {Guid}
     */
    static CLSID => Guid("{7ccdf9f4-e576-455a-8bc7-f6ec68d6f063}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBanner", "ClearBanner", "ClearAllBanners", "GetBanner"]

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

        result := ComCall(6, this, "ptr", providerIdentity, "ptr", subscriptionId, "ptr*", &contentId := 0, "HRESULT")
        return contentId
    }
}
