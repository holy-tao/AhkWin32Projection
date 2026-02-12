#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentToken.ahk
#Include .\IPaymentTokenFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class containing details about a payment token.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymenttoken
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentToken extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentToken

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentToken.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [PaymentToken](paymenttoken.md) object.
     * @param {HSTRING} paymentMethodId The payment method ID.
     * @returns {PaymentToken} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymenttoken.#ctor
     */
    static Create(paymentMethodId) {
        if (!PaymentToken.HasProp("__IPaymentTokenFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentToken")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentTokenFactory.IID)
            PaymentToken.__IPaymentTokenFactory := IPaymentTokenFactory(factoryPtr)
        }

        return PaymentToken.__IPaymentTokenFactory.Create(paymentMethodId)
    }

    /**
     * Creates a [PaymentToken](paymenttoken.md) object.
     * @param {HSTRING} paymentMethodId The payment method ID.
     * @param {HSTRING} jsonDetails The JSON details.
     * @returns {PaymentToken} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymenttoken.#ctor
     */
    static CreateWithJsonDetails(paymentMethodId, jsonDetails) {
        if (!PaymentToken.HasProp("__IPaymentTokenFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentToken")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentTokenFactory.IID)
            PaymentToken.__IPaymentTokenFactory := IPaymentTokenFactory(factoryPtr)
        }

        return PaymentToken.__IPaymentTokenFactory.CreateWithJsonDetails(paymentMethodId, jsonDetails)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The payment method ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymenttoken.paymentmethodid
     * @type {HSTRING} 
     */
    PaymentMethodId {
        get => this.get_PaymentMethodId()
    }

    /**
     * Details of the payment token. This contains the information that the merchant will use to process the payment. The format of the data will depend on the payment method used. For example, if the Basic Card Payment method is being used, then this must contain data conforming to the [BasicCardResponse dictionary](https://www.w3.org/TR/payment-method-basic-card/#basiccardresponse) type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymenttoken.jsondetails
     * @type {HSTRING} 
     */
    JsonDetails {
        get => this.get_JsonDetails()
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
    get_PaymentMethodId() {
        if (!this.HasProp("__IPaymentToken")) {
            if ((queryResult := this.QueryInterface(IPaymentToken.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentToken := IPaymentToken(outPtr)
        }

        return this.__IPaymentToken.get_PaymentMethodId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JsonDetails() {
        if (!this.HasProp("__IPaymentToken")) {
            if ((queryResult := this.QueryInterface(IPaymentToken.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentToken := IPaymentToken(outPtr)
        }

        return this.__IPaymentToken.get_JsonDetails()
    }

;@endregion Instance Methods
}
