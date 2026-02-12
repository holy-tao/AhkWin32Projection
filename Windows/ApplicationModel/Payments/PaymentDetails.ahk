#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentDetails.ahk
#Include .\IPaymentDetailsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class provides information about the requested transaction; it is passed to the [PaymentRequest](paymentrequest.md) and [PaymentRequestChangedResult](paymentrequestchangedresult.md) constructors. This class reflects the [W3C PaymentDetails dictionary](https://aka.ms/prapi#paymentdetailsmodifier-dictionary).
 * @remarks
 * If this class is used to update the payment request in [PaymentRequestChangedResult](paymentrequestchangedresult.md), properties that are null indicate that property hasn't been changed and that the old property value should
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentDetails.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [PaymentDetails](paymentdetails.md) object.
     * @param {PaymentItem} total The total.
     * @returns {PaymentDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails.#ctor
     */
    static Create(total) {
        if (!PaymentDetails.HasProp("__IPaymentDetailsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentDetails")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentDetailsFactory.IID)
            PaymentDetails.__IPaymentDetailsFactory := IPaymentDetailsFactory(factoryPtr)
        }

        return PaymentDetails.__IPaymentDetailsFactory.Create(total)
    }

    /**
     * Creates a [PaymentDetails](paymentdetails.md) object.
     * @param {PaymentItem} total The total.
     * @param {IIterable<PaymentItem>} displayItems The display items.
     * @returns {PaymentDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails.#ctor
     */
    static CreateWithDisplayItems(total, displayItems) {
        if (!PaymentDetails.HasProp("__IPaymentDetailsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentDetails")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentDetailsFactory.IID)
            PaymentDetails.__IPaymentDetailsFactory := IPaymentDetailsFactory(factoryPtr)
        }

        return PaymentDetails.__IPaymentDetailsFactory.CreateWithDisplayItems(total, displayItems)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * This is the total cost of the transaction.
     * @remarks
     * Apps should validate that this value matches the sum of the [DisplayItems](paymentdetails_displayitems.md) and the selected shipping option.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails.total
     * @type {PaymentItem} 
     */
    Total {
        get => this.get_Total()
        set => this.put_Total(value)
    }

    /**
     * This is a collection of [PaymentItem](paymentitem.md) classes items for a payment request. These represent the breakdown of items in the payment request. Some examples are shoes or taxes.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails.displayitems
     * @type {IVectorView<PaymentItem>} 
     */
    DisplayItems {
        get => this.get_DisplayItems()
        set => this.put_DisplayItems(value)
    }

    /**
     * A collection of [PaymentShippingOption](paymentshippingoption.md) classes for a payment request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails.shippingoptions
     * @type {IVectorView<PaymentShippingOption>} 
     */
    ShippingOptions {
        get => this.get_ShippingOptions()
        set => this.put_ShippingOptions(value)
    }

    /**
     * A collection of [PaymentDetailsModifier](paymentdetailsmodifier.md) classes for which provide the ability to change the transaction cost based on the payment method used.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetails.modifiers
     * @type {IVectorView<PaymentDetailsModifier>} 
     */
    Modifiers {
        get => this.get_Modifiers()
        set => this.put_Modifiers(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [PaymentDetails](paymentdetails.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentDetails")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PaymentItem} 
     */
    get_Total() {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.get_Total()
    }

    /**
     * 
     * @param {PaymentItem} value 
     * @returns {HRESULT} 
     */
    put_Total(value) {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.put_Total(value)
    }

    /**
     * 
     * @returns {IVectorView<PaymentItem>} 
     */
    get_DisplayItems() {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.get_DisplayItems()
    }

    /**
     * 
     * @param {IVectorView<PaymentItem>} value 
     * @returns {HRESULT} 
     */
    put_DisplayItems(value) {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.put_DisplayItems(value)
    }

    /**
     * 
     * @returns {IVectorView<PaymentShippingOption>} 
     */
    get_ShippingOptions() {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.get_ShippingOptions()
    }

    /**
     * 
     * @param {IVectorView<PaymentShippingOption>} value 
     * @returns {HRESULT} 
     */
    put_ShippingOptions(value) {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.put_ShippingOptions(value)
    }

    /**
     * 
     * @returns {IVectorView<PaymentDetailsModifier>} 
     */
    get_Modifiers() {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.get_Modifiers()
    }

    /**
     * 
     * @param {IVectorView<PaymentDetailsModifier>} value 
     * @returns {HRESULT} 
     */
    put_Modifiers(value) {
        if (!this.HasProp("__IPaymentDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetails := IPaymentDetails(outPtr)
        }

        return this.__IPaymentDetails.put_Modifiers(value)
    }

;@endregion Instance Methods
}
