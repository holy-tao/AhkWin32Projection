#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentTransaction.ahk
#Include .\IPaymentTransactionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains information about a payment transaction that was submitted through the [Windows.ApplicationModel.Payments](windows_applicationmodel_payments_provider.md) API. The payment provider app uses this class to accept that payment transaction or reject it after verifying the payment through the provider's infrastructure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class PaymentTransaction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentTransaction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentTransaction.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [PaymentTransaction](paymenttransaction.md) object from an ID.
     * @param {HSTRING} id The ID.
     * @returns {IAsyncOperation<PaymentTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.fromidasync
     */
    static FromIdAsync(id) {
        if (!PaymentTransaction.HasProp("__IPaymentTransactionStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.Provider.PaymentTransaction")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentTransactionStatics.IID)
            PaymentTransaction.__IPaymentTransactionStatics := IPaymentTransactionStatics(factoryPtr)
        }

        return PaymentTransaction.__IPaymentTransactionStatics.FromIdAsync(id)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The payment request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.paymentrequest
     * @type {PaymentRequest} 
     */
    PaymentRequest {
        get => this.get_PaymentRequest()
    }

    /**
     * The payer email.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.payeremail
     * @type {HSTRING} 
     */
    PayerEmail {
        get => this.get_PayerEmail()
        set => this.put_PayerEmail(value)
    }

    /**
     * The payer name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.payername
     * @type {HSTRING} 
     */
    PayerName {
        get => this.get_PayerName()
        set => this.put_PayerName(value)
    }

    /**
     * The payer phone number.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.payerphonenumber
     * @type {HSTRING} 
     */
    PayerPhoneNumber {
        get => this.get_PayerPhoneNumber()
        set => this.put_PayerPhoneNumber(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PaymentRequest} 
     */
    get_PaymentRequest() {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.get_PaymentRequest()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerEmail() {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.get_PayerEmail()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayerEmail(value) {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.put_PayerEmail(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerName() {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.get_PayerName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayerName(value) {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.put_PayerName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerPhoneNumber() {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.get_PayerPhoneNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayerPhoneNumber(value) {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.put_PayerPhoneNumber(value)
    }

    /**
     * Updates the shipping address.
     * @param {PaymentAddress} shippingAddress The shipping address.
     * @returns {IAsyncOperation<PaymentRequestChangedResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.updateshippingaddressasync
     */
    UpdateShippingAddressAsync(shippingAddress) {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.UpdateShippingAddressAsync(shippingAddress)
    }

    /**
     * Updates the selected shipping option.
     * @param {PaymentShippingOption} selectedShippingOption The selected shipping option.
     * @returns {IAsyncOperation<PaymentRequestChangedResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.updateselectedshippingoptionasync
     */
    UpdateSelectedShippingOptionAsync(selectedShippingOption) {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.UpdateSelectedShippingOptionAsync(selectedShippingOption)
    }

    /**
     * Accepts the payment.
     * @param {PaymentToken} paymentToken_ The payment token.
     * @returns {IAsyncOperation<PaymentTransactionAcceptResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.acceptasync
     */
    AcceptAsync(paymentToken_) {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.AcceptAsync(paymentToken_)
    }

    /**
     * Rejects the payment transation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymenttransaction.reject
     */
    Reject() {
        if (!this.HasProp("__IPaymentTransaction")) {
            if ((queryResult := this.QueryInterface(IPaymentTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentTransaction := IPaymentTransaction(outPtr)
        }

        return this.__IPaymentTransaction.Reject()
    }

;@endregion Instance Methods
}
