#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\StorePrice.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StorePurchaseResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreAvailability extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreAvailability
     * @type {Guid}
     */
    static IID => Guid("{fa060325-0ffd-4493-ad43-f1f9918f69fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StoreId", "get_EndDate", "get_Price", "get_ExtendedJsonData", "RequestPurchaseAsync", "RequestPurchaseWithPurchasePropertiesAsync"]

    /**
     * @type {HSTRING} 
     */
    StoreId {
        get => this.get_StoreId()
    }

    /**
     * @type {DateTime} 
     */
    EndDate {
        get => this.get_EndDate()
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
     * @returns {DateTime} 
     */
    get_EndDate() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
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
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
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
        result := ComCall(11, this, "ptr", storePurchaseProperties_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePurchaseResult, operation)
    }
}
