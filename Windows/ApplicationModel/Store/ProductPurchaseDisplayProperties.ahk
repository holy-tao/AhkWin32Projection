#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProductPurchaseDisplayProperties.ahk
#Include .\IProductPurchaseDisplayPropertiesFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to provide the product name that is displayed to the user at time of purchase. This class is used in the creation of a [RequestProductPurchaseAsync](/uwp/api/windows.applicationmodel.store.currentapp.requestproductpurchaseasync) operation to visually represent a specific offer within a large catalog of in-app products, which is represented by a single product entry in the Microsoft Store.
  * 
  * > [!NOTE]
  * > Windows Phone 8 developers can also display an image associated with the product by providing a URI with *image* for display and an internally consumed *description*.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productpurchasedisplayproperties
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ProductPurchaseDisplayProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProductPurchaseDisplayProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProductPurchaseDisplayProperties.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [ProductPurchaseDisplayProperties](productpurchasedisplayproperties.md) that includes the specified product name to display to the user.
     * @param {HSTRING} name The product name displayed to the user.
     * @returns {ProductPurchaseDisplayProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productpurchasedisplayproperties.#ctor
     */
    static CreateProductPurchaseDisplayProperties(name) {
        if (!ProductPurchaseDisplayProperties.HasProp("__IProductPurchaseDisplayPropertiesFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.ProductPurchaseDisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProductPurchaseDisplayPropertiesFactory.IID)
            ProductPurchaseDisplayProperties.__IProductPurchaseDisplayPropertiesFactory := IProductPurchaseDisplayPropertiesFactory(factoryPtr)
        }

        return ProductPurchaseDisplayProperties.__IProductPurchaseDisplayPropertiesFactory.CreateProductPurchaseDisplayProperties(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the product name that is displayed to the user at time of purchase.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productpurchasedisplayproperties.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Windows Phone only. This is an internal product description.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productpurchasedisplayproperties.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Windows Phone only. Gets or sets the location of an image used to represent the product at time of purchase.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productpurchasedisplayproperties.image
     * @type {Uri} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [ProductPurchaseDisplayProperties](productpurchasedisplayproperties.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.ProductPurchaseDisplayProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IProductPurchaseDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IProductPurchaseDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductPurchaseDisplayProperties := IProductPurchaseDisplayProperties(outPtr)
        }

        return this.__IProductPurchaseDisplayProperties.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IProductPurchaseDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IProductPurchaseDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductPurchaseDisplayProperties := IProductPurchaseDisplayProperties(outPtr)
        }

        return this.__IProductPurchaseDisplayProperties.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IProductPurchaseDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IProductPurchaseDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductPurchaseDisplayProperties := IProductPurchaseDisplayProperties(outPtr)
        }

        return this.__IProductPurchaseDisplayProperties.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IProductPurchaseDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IProductPurchaseDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductPurchaseDisplayProperties := IProductPurchaseDisplayProperties(outPtr)
        }

        return this.__IProductPurchaseDisplayProperties.put_Description(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Image() {
        if (!this.HasProp("__IProductPurchaseDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IProductPurchaseDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductPurchaseDisplayProperties := IProductPurchaseDisplayProperties(outPtr)
        }

        return this.__IProductPurchaseDisplayProperties.get_Image()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IProductPurchaseDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IProductPurchaseDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductPurchaseDisplayProperties := IProductPurchaseDisplayProperties(outPtr)
        }

        return this.__IProductPurchaseDisplayProperties.put_Image(value)
    }

;@endregion Instance Methods
}
