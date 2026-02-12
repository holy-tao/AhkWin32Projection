#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentDetailsModifier.ahk
#Include .\IPaymentDetailsModifierFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class is used when payment methods (see [PaymentRequest.MethodData](paymentrequest_methoddata.md)) have additional costs or discounts associated with them. This class reflects the [W3C PaymentDetailsModifier dictionary](https://aka.ms/prapi#paymentdetailsmodifier-dictionary).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentDetailsModifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentDetailsModifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentDetailsModifier.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [PaymentDetailsModifier](paymentdetailsmodifier.md) object.
     * @param {IIterable<HSTRING>} supportedMethodIds The supported method IDs.
     * @param {PaymentItem} total The total.
     * @returns {PaymentDetailsModifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.#ctor
     */
    static Create(supportedMethodIds, total) {
        if (!PaymentDetailsModifier.HasProp("__IPaymentDetailsModifierFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentDetailsModifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentDetailsModifierFactory.IID)
            PaymentDetailsModifier.__IPaymentDetailsModifierFactory := IPaymentDetailsModifierFactory(factoryPtr)
        }

        return PaymentDetailsModifier.__IPaymentDetailsModifierFactory.Create(supportedMethodIds, total)
    }

    /**
     * Creates a [PaymentDetailsModifier](paymentdetailsmodifier.md) object.
     * @param {IIterable<HSTRING>} supportedMethodIds The supported method IDs.
     * @param {PaymentItem} total The total.
     * @param {IIterable<PaymentItem>} additionalDisplayItems The additional display items.
     * @returns {PaymentDetailsModifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.#ctor
     */
    static CreateWithAdditionalDisplayItems(supportedMethodIds, total, additionalDisplayItems) {
        if (!PaymentDetailsModifier.HasProp("__IPaymentDetailsModifierFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentDetailsModifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentDetailsModifierFactory.IID)
            PaymentDetailsModifier.__IPaymentDetailsModifierFactory := IPaymentDetailsModifierFactory(factoryPtr)
        }

        return PaymentDetailsModifier.__IPaymentDetailsModifierFactory.CreateWithAdditionalDisplayItems(supportedMethodIds, total, additionalDisplayItems)
    }

    /**
     * Creates a [PaymentDetailsModifier](paymentdetailsmodifier.md) object.
     * @param {IIterable<HSTRING>} supportedMethodIds The supported method IDs.
     * @param {PaymentItem} total The total.
     * @param {IIterable<PaymentItem>} additionalDisplayItems The additioanl display items.
     * @param {HSTRING} jsonData 
     * @returns {PaymentDetailsModifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.#ctor
     */
    static CreateWithAdditionalDisplayItemsAndJsonData(supportedMethodIds, total, additionalDisplayItems, jsonData) {
        if (!PaymentDetailsModifier.HasProp("__IPaymentDetailsModifierFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentDetailsModifier")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentDetailsModifierFactory.IID)
            PaymentDetailsModifier.__IPaymentDetailsModifierFactory := IPaymentDetailsModifierFactory(factoryPtr)
        }

        return PaymentDetailsModifier.__IPaymentDetailsModifierFactory.CreateWithAdditionalDisplayItemsAndJsonData(supportedMethodIds, total, additionalDisplayItems, jsonData)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Optional information.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.jsondata
     * @type {HSTRING} 
     */
    JsonData {
        get => this.get_JsonData()
    }

    /**
     * A collection of payment method that this modifier applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.supportedmethodids
     * @type {IVectorView<HSTRING>} 
     */
    SupportedMethodIds {
        get => this.get_SupportedMethodIds()
    }

    /**
     * This is the total of all [DisplayItems](paymentdetails_displayitems.md). This value serves as a replacement for the [PaymentDetails.Total](paymentdetails_total.md) property when one of the payment methods in the [SupportedMethodIds](paymentdetailsmodifier_supportedmethodids.md) list is used. Therefore, this value needs to be the sum of [PaymentDetail.DisplayItems](paymentdetails_displayitems.md), the selected shipping option in the [PaymentDetails.ShippingOptions](paymentdetails_shippingoptions.md) collection (See [PaymentShippingOption.IsSelected](paymentshippingoption_isselected.md)), and [AdditionalDisplayItems](paymentdetailsmodifier_additionaldisplayitems.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.total
     * @type {PaymentItem} 
     */
    Total {
        get => this.get_Total()
    }

    /**
     * The additional display items.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentdetailsmodifier.additionaldisplayitems
     * @type {IVectorView<PaymentItem>} 
     */
    AdditionalDisplayItems {
        get => this.get_AdditionalDisplayItems()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JsonData() {
        if (!this.HasProp("__IPaymentDetailsModifier")) {
            if ((queryResult := this.QueryInterface(IPaymentDetailsModifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetailsModifier := IPaymentDetailsModifier(outPtr)
        }

        return this.__IPaymentDetailsModifier.get_JsonData()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedMethodIds() {
        if (!this.HasProp("__IPaymentDetailsModifier")) {
            if ((queryResult := this.QueryInterface(IPaymentDetailsModifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetailsModifier := IPaymentDetailsModifier(outPtr)
        }

        return this.__IPaymentDetailsModifier.get_SupportedMethodIds()
    }

    /**
     * 
     * @returns {PaymentItem} 
     */
    get_Total() {
        if (!this.HasProp("__IPaymentDetailsModifier")) {
            if ((queryResult := this.QueryInterface(IPaymentDetailsModifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetailsModifier := IPaymentDetailsModifier(outPtr)
        }

        return this.__IPaymentDetailsModifier.get_Total()
    }

    /**
     * 
     * @returns {IVectorView<PaymentItem>} 
     */
    get_AdditionalDisplayItems() {
        if (!this.HasProp("__IPaymentDetailsModifier")) {
            if ((queryResult := this.QueryInterface(IPaymentDetailsModifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentDetailsModifier := IPaymentDetailsModifier(outPtr)
        }

        return this.__IPaymentDetailsModifier.get_AdditionalDisplayItems()
    }

;@endregion Instance Methods
}
