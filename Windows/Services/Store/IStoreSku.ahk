#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\StoreImage.ahk
#Include .\StoreVideo.ahk
#Include .\StoreAvailability.ahk
#Include .\StorePrice.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\StoreCollectionData.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StorePurchaseResult.ahk
#Include .\StoreSubscriptionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreSku extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreSku
     * @type {Guid}
     */
    static IID => Guid("{397e6f55-4440-4f03-863c-91f3fec83d79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StoreId", "get_Language", "get_Title", "get_Description", "get_IsTrial", "get_CustomDeveloperData", "get_Images", "get_Videos", "get_Availabilities", "get_Price", "get_ExtendedJsonData", "get_IsInUserCollection", "get_BundledSkus", "get_CollectionData", "GetIsInstalledAsync", "RequestPurchaseAsync", "RequestPurchaseWithPurchasePropertiesAsync", "get_IsSubscription", "get_SubscriptionInfo"]

    /**
     * @type {HSTRING} 
     */
    StoreId {
        get => this.get_StoreId()
    }

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * @type {HSTRING} 
     */
    CustomDeveloperData {
        get => this.get_CustomDeveloperData()
    }

    /**
     * @type {IVectorView<StoreImage>} 
     */
    Images {
        get => this.get_Images()
    }

    /**
     * @type {IVectorView<StoreVideo>} 
     */
    Videos {
        get => this.get_Videos()
    }

    /**
     * @type {IVectorView<StoreAvailability>} 
     */
    Availabilities {
        get => this.get_Availabilities()
    }

    /**
     * @type {StorePrice} 
     */
    Price {
        get => this.get_Price()
    }

    /**
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * @type {Boolean} 
     */
    IsInUserCollection {
        get => this.get_IsInUserCollection()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    BundledSkus {
        get => this.get_BundledSkus()
    }

    /**
     * @type {StoreCollectionData} 
     */
    CollectionData {
        get => this.get_CollectionData()
    }

    /**
     * @type {Boolean} 
     */
    IsSubscription {
        get => this.get_IsSubscription()
    }

    /**
     * @type {StoreSubscriptionInfo} 
     */
    SubscriptionInfo {
        get => this.get_SubscriptionInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomDeveloperData() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<StoreImage>} 
     */
    get_Images() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StoreImage, value)
    }

    /**
     * 
     * @returns {IVectorView<StoreVideo>} 
     */
    get_Videos() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StoreVideo, value)
    }

    /**
     * 
     * @returns {IVectorView<StoreAvailability>} 
     */
    get_Availabilities() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StoreAvailability, value)
    }

    /**
     * 
     * @returns {StorePrice} 
     */
    get_Price() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorePrice(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInUserCollection() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_BundledSkus() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {StoreCollectionData} 
     */
    get_CollectionData() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StoreCollectionData(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsInstalledAsync() {
        result := ComCall(20, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseAsync() {
        result := ComCall(21, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePurchaseResult, operation)
    }

    /**
     * 
     * @param {StorePurchaseProperties} storePurchaseProperties_ 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_) {
        result := ComCall(22, this, "ptr", storePurchaseProperties_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePurchaseResult, operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSubscription() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {StoreSubscriptionInfo} 
     */
    get_SubscriptionInfo() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StoreSubscriptionInfo(value)
    }
}
