#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\StoreImage.ahk
#Include .\StoreVideo.ahk
#Include .\StoreSku.ahk
#Include .\StorePrice.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StorePurchaseResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreProduct extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreProduct
     * @type {Guid}
     */
    static IID => Guid("{320e2c52-d760-450a-a42b-67d1e901ac90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StoreId", "get_Language", "get_Title", "get_Description", "get_ProductKind", "get_HasDigitalDownload", "get_Keywords", "get_Images", "get_Videos", "get_Skus", "get_IsInUserCollection", "get_Price", "get_ExtendedJsonData", "get_LinkUri", "GetIsAnySkuInstalledAsync", "RequestPurchaseAsync", "RequestPurchaseWithPurchasePropertiesAsync", "get_InAppOfferToken"]

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
     * @type {HSTRING} 
     */
    ProductKind {
        get => this.get_ProductKind()
    }

    /**
     * @type {Boolean} 
     */
    HasDigitalDownload {
        get => this.get_HasDigitalDownload()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Keywords {
        get => this.get_Keywords()
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
     * @type {IVectorView<StoreSku>} 
     */
    Skus {
        get => this.get_Skus()
    }

    /**
     * @type {Boolean} 
     */
    IsInUserCollection {
        get => this.get_IsInUserCollection()
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
     * @type {Uri} 
     */
    LinkUri {
        get => this.get_LinkUri()
    }

    /**
     * @type {HSTRING} 
     */
    InAppOfferToken {
        get => this.get_InAppOfferToken()
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
     * @returns {HSTRING} 
     */
    get_ProductKind() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasDigitalDownload() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Keywords() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<StoreImage>} 
     */
    get_Images() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
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
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StoreVideo, value)
    }

    /**
     * 
     * @returns {IVectorView<StoreSku>} 
     */
    get_Skus() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StoreSku, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInUserCollection() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {StorePrice} 
     */
    get_Price() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
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
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LinkUri() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsAnySkuInstalledAsync() {
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
     * @returns {HSTRING} 
     */
    get_InAppOfferToken() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
