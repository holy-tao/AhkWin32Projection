#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePurchaseProperties.ahk
#Include .\IStorePurchasePropertiesFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains additional details that you can pass to a purchase request for a product, including the product name to display to the user during the purchase.
 * @remarks
 * The **RequestPurchaseAsync** methods of the [StoreContext](storecontext.md), [StoreProduct](storeproduct.md), [StoreSku](storesku.md), and [StoreAvailability](storeavailability.md) classes have overloads that accept an argument of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseproperties
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePurchaseProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePurchaseProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePurchaseProperties.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [StorePurchaseProperties](storepurchaseproperties.md) class. This overload provides the option to specify the product name that is displayed to the user during the purchase.
     * @param {HSTRING} name The product name that is displayed to the user during the purchase.
     * @returns {StorePurchaseProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseproperties.#ctor
     */
    static Create(name) {
        if (!StorePurchaseProperties.HasProp("__IStorePurchasePropertiesFactory")) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StorePurchaseProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorePurchasePropertiesFactory.IID)
            StorePurchaseProperties.__IStorePurchasePropertiesFactory := IStorePurchasePropertiesFactory(factoryPtr)
        }

        return StorePurchaseProperties.__IStorePurchasePropertiesFactory.Create(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the product name that is displayed to the user during the purchase. The specified name appears in the title bar of the purchase UI.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseproperties.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets a JSON-formatted string that contains extended data to pass with the purchase request to the Microsoft Store.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StorePurchaseProperties](storepurchaseproperties.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * 
     * If you want to associate the purchase request with a custom campaign, you can add a field named ```DevOfferId``` to the JSON string that is returned by this property and then assign the updated string to this property. You can then retrieve this value later by accessing the [DeveloperOfferId](storecollectiondata_developerofferid.md) property of a [StoreCollectionData](storecollectiondata.md) object. Here is an example JSON string that includes a ```DevOfferId``` field: ```"{\"DevOfferId\": \"your campaign ID\" }"```.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseproperties.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
        set => this.put_ExtendedJsonData(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [StorePurchaseProperties](storepurchaseproperties.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StorePurchaseProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IStorePurchaseProperties")) {
            if ((queryResult := this.QueryInterface(IStorePurchaseProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePurchaseProperties := IStorePurchaseProperties(outPtr)
        }

        return this.__IStorePurchaseProperties.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IStorePurchaseProperties")) {
            if ((queryResult := this.QueryInterface(IStorePurchaseProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePurchaseProperties := IStorePurchaseProperties(outPtr)
        }

        return this.__IStorePurchaseProperties.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStorePurchaseProperties")) {
            if ((queryResult := this.QueryInterface(IStorePurchaseProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePurchaseProperties := IStorePurchaseProperties(outPtr)
        }

        return this.__IStorePurchaseProperties.get_ExtendedJsonData()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExtendedJsonData(value) {
        if (!this.HasProp("__IStorePurchaseProperties")) {
            if ((queryResult := this.QueryInterface(IStorePurchaseProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePurchaseProperties := IStorePurchaseProperties(outPtr)
        }

        return this.__IStorePurchaseProperties.put_ExtendedJsonData(value)
    }

;@endregion Instance Methods
}
