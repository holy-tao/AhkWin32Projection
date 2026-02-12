#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentResponse.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that contains the payment response. This class reflects the [W3C PaymentResponse interface](https://www.w3.org/TR/payment-request/#paymentrequest-interface).
 * @remarks
 * An object of this class type is created and retrieved through the [PaymentRequestSubmitResult.Response](paymentrequestsubmitresult_response.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentResponse.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The payment token.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.paymenttoken
     * @type {PaymentToken} 
     */
    PaymentToken {
        get => this.get_PaymentToken()
    }

    /**
     * The shipping option
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.shippingoption
     * @type {PaymentShippingOption} 
     */
    ShippingOption {
        get => this.get_ShippingOption()
    }

    /**
     * The shipping address.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.shippingaddress
     * @type {PaymentAddress} 
     */
    ShippingAddress {
        get => this.get_ShippingAddress()
    }

    /**
     * The payer email.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.payeremail
     * @type {HSTRING} 
     */
    PayerEmail {
        get => this.get_PayerEmail()
    }

    /**
     * The payer name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.payername
     * @type {HSTRING} 
     */
    PayerName {
        get => this.get_PayerName()
    }

    /**
     * The payer phone number.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.payerphonenumber
     * @type {HSTRING} 
     */
    PayerPhoneNumber {
        get => this.get_PayerPhoneNumber()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PaymentToken} 
     */
    get_PaymentToken() {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.get_PaymentToken()
    }

    /**
     * 
     * @returns {PaymentShippingOption} 
     */
    get_ShippingOption() {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.get_ShippingOption()
    }

    /**
     * 
     * @returns {PaymentAddress} 
     */
    get_ShippingAddress() {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.get_ShippingAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerEmail() {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.get_PayerEmail()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerName() {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.get_PayerName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerPhoneNumber() {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.get_PayerPhoneNumber()
    }

    /**
     * Completes a payment response.
     * @param {Integer} status_ The status.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentresponse.completeasync
     */
    CompleteAsync(status_) {
        if (!this.HasProp("__IPaymentResponse")) {
            if ((queryResult := this.QueryInterface(IPaymentResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentResponse := IPaymentResponse(outPtr)
        }

        return this.__IPaymentResponse.CompleteAsync(status_)
    }

;@endregion Instance Methods
}
