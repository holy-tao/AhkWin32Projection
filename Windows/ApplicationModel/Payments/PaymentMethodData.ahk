#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentMethodData.ahk
#Include .\IPaymentMethodDataFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class containing data about a payment method. This class reflects the [W3C PaymentMethodData dictionary](https://www.w3.org/TR/payment-request/#paymentitem-dictionary).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmethoddata
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentMethodData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentMethodData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentMethodData.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [PaymentMethodData](paymentmethoddata.md) object.
     * @param {IIterable<HSTRING>} supportedMethodIds The supported method IDs.
     * @returns {PaymentMethodData} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmethoddata.#ctor
     */
    static Create(supportedMethodIds) {
        if (!PaymentMethodData.HasProp("__IPaymentMethodDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentMethodData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentMethodDataFactory.IID)
            PaymentMethodData.__IPaymentMethodDataFactory := IPaymentMethodDataFactory(factoryPtr)
        }

        return PaymentMethodData.__IPaymentMethodDataFactory.Create(supportedMethodIds)
    }

    /**
     * Creates a [PaymentMethodData](paymentmethoddata.md) object.
     * @param {IIterable<HSTRING>} supportedMethodIds The supported method IDs.
     * @param {HSTRING} jsonData The data associated with a payment method.
     * @returns {PaymentMethodData} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmethoddata.#ctor
     */
    static CreateWithJsonData(supportedMethodIds, jsonData) {
        if (!PaymentMethodData.HasProp("__IPaymentMethodDataFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentMethodData")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentMethodDataFactory.IID)
            PaymentMethodData.__IPaymentMethodDataFactory := IPaymentMethodDataFactory(factoryPtr)
        }

        return PaymentMethodData.__IPaymentMethodDataFactory.CreateWithJsonData(supportedMethodIds, jsonData)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The supported method IDs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmethoddata.supportedmethodids
     * @type {IVectorView<HSTRING>} 
     */
    SupportedMethodIds {
        get => this.get_SupportedMethodIds()
    }

    /**
     * Data about the payment method. For example, if the [Basic Card Payment](https://www.w3.org/TR/payment-method-basic-card/) method is being used then this must contain data confirming to the [BasicCardRequest](https://www.w3.org/TR/payment-method-basic-card/#basiccardrequest) dictionary type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmethoddata.jsondata
     * @type {HSTRING} 
     */
    JsonData {
        get => this.get_JsonData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedMethodIds() {
        if (!this.HasProp("__IPaymentMethodData")) {
            if ((queryResult := this.QueryInterface(IPaymentMethodData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMethodData := IPaymentMethodData(outPtr)
        }

        return this.__IPaymentMethodData.get_SupportedMethodIds()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JsonData() {
        if (!this.HasProp("__IPaymentMethodData")) {
            if ((queryResult := this.QueryInterface(IPaymentMethodData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMethodData := IPaymentMethodData(outPtr)
        }

        return this.__IPaymentMethodData.get_JsonData()
    }

;@endregion Instance Methods
}
