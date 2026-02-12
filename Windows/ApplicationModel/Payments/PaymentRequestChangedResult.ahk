#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentRequestChangedResult.ahk
#Include .\IPaymentRequestChangedResultFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The result of the payment changed payment request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedresult
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequestChangedResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentRequestChangedResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentRequestChangedResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [PaymentRequestChangedResult](paymentrequestchangedresult.md) object.
     * @param {Boolean} changeAcceptedByMerchant Whether the change was accepted by the merchant.
     * @returns {PaymentRequestChangedResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedresult.#ctor
     */
    static Create(changeAcceptedByMerchant) {
        if (!PaymentRequestChangedResult.HasProp("__IPaymentRequestChangedResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentRequestChangedResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentRequestChangedResultFactory.IID)
            PaymentRequestChangedResult.__IPaymentRequestChangedResultFactory := IPaymentRequestChangedResultFactory(factoryPtr)
        }

        return PaymentRequestChangedResult.__IPaymentRequestChangedResultFactory.Create(changeAcceptedByMerchant)
    }

    /**
     * Creates a new [PaymentRequestChangedResult](paymentrequestchangedresult.md) object.
     * @param {Boolean} changeAcceptedByMerchant Whether the change is accepted by the merchant.
     * @param {PaymentDetails} updatedPaymentDetails The updated payment details.
     * @returns {PaymentRequestChangedResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedresult.#ctor
     */
    static CreateWithPaymentDetails(changeAcceptedByMerchant, updatedPaymentDetails) {
        if (!PaymentRequestChangedResult.HasProp("__IPaymentRequestChangedResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentRequestChangedResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentRequestChangedResultFactory.IID)
            PaymentRequestChangedResult.__IPaymentRequestChangedResultFactory := IPaymentRequestChangedResultFactory(factoryPtr)
        }

        return PaymentRequestChangedResult.__IPaymentRequestChangedResultFactory.CreateWithPaymentDetails(changeAcceptedByMerchant, updatedPaymentDetails)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates whether the change was accepted by the merchant. For example, this might be set to false, if the user specified an overseas shipping address but the merchant is unwilling to ship internationally.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedresult.changeacceptedbymerchant
     * @type {Boolean} 
     */
    ChangeAcceptedByMerchant {
        get => this.get_ChangeAcceptedByMerchant()
        set => this.put_ChangeAcceptedByMerchant(value)
    }

    /**
     * The message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedresult.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * The updated payment details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedresult.updatedpaymentdetails
     * @type {PaymentDetails} 
     */
    UpdatedPaymentDetails {
        get => this.get_UpdatedPaymentDetails()
        set => this.put_UpdatedPaymentDetails(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ChangeAcceptedByMerchant() {
        if (!this.HasProp("__IPaymentRequestChangedResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedResult := IPaymentRequestChangedResult(outPtr)
        }

        return this.__IPaymentRequestChangedResult.get_ChangeAcceptedByMerchant()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ChangeAcceptedByMerchant(value) {
        if (!this.HasProp("__IPaymentRequestChangedResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedResult := IPaymentRequestChangedResult(outPtr)
        }

        return this.__IPaymentRequestChangedResult.put_ChangeAcceptedByMerchant(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IPaymentRequestChangedResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedResult := IPaymentRequestChangedResult(outPtr)
        }

        return this.__IPaymentRequestChangedResult.get_Message()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Message(value) {
        if (!this.HasProp("__IPaymentRequestChangedResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedResult := IPaymentRequestChangedResult(outPtr)
        }

        return this.__IPaymentRequestChangedResult.put_Message(value)
    }

    /**
     * 
     * @returns {PaymentDetails} 
     */
    get_UpdatedPaymentDetails() {
        if (!this.HasProp("__IPaymentRequestChangedResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedResult := IPaymentRequestChangedResult(outPtr)
        }

        return this.__IPaymentRequestChangedResult.get_UpdatedPaymentDetails()
    }

    /**
     * 
     * @param {PaymentDetails} value 
     * @returns {HRESULT} 
     */
    put_UpdatedPaymentDetails(value) {
        if (!this.HasProp("__IPaymentRequestChangedResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedResult := IPaymentRequestChangedResult(outPtr)
        }

        return this.__IPaymentRequestChangedResult.put_UpdatedPaymentDetails(value)
    }

;@endregion Instance Methods
}
