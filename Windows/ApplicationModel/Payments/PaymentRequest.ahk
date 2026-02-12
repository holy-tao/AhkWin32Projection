#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentRequest.ahk
#Include .\IPaymentRequest2.ahk
#Include .\IPaymentRequestFactory2.ahk
#Include .\IPaymentRequestFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that contains information about a payment request. This class is reflects the [W3C PaymentRequest interface](https://www.w3.org/TR/payment-request/#paymentrequest-interface).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new PaymentRequest object.
     * @param {PaymentDetails} details The details.
     * @param {IIterable<PaymentMethodData>} methodData_ The method data.
     * @param {PaymentMerchantInfo} merchantInfo The merchantInfo.
     * @param {PaymentOptions} options The options.
     * @param {HSTRING} id The ID.
     * @returns {PaymentRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.#ctor
     */
    static CreateWithMerchantInfoOptionsAndId(details, methodData_, merchantInfo, options, id) {
        if (!PaymentRequest.HasProp("__IPaymentRequestFactory2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentRequestFactory2.IID)
            PaymentRequest.__IPaymentRequestFactory2 := IPaymentRequestFactory2(factoryPtr)
        }

        return PaymentRequest.__IPaymentRequestFactory2.CreateWithMerchantInfoOptionsAndId(details, methodData_, merchantInfo, options, id)
    }

    /**
     * Creates a [PaymentRequest](paymentrequest.md) object.
     * @param {PaymentDetails} details The details.
     * @param {IIterable<PaymentMethodData>} methodData_ The method data.
     * @returns {PaymentRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.#ctor
     */
    static Create(details, methodData_) {
        if (!PaymentRequest.HasProp("__IPaymentRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentRequestFactory.IID)
            PaymentRequest.__IPaymentRequestFactory := IPaymentRequestFactory(factoryPtr)
        }

        return PaymentRequest.__IPaymentRequestFactory.Create(details, methodData_)
    }

    /**
     * Creates a [PaymentRequest](paymentrequest.md) object.
     * @param {PaymentDetails} details The details.
     * @param {IIterable<PaymentMethodData>} methodData_ The method data.
     * @param {PaymentMerchantInfo} merchantInfo The merchant information.
     * @returns {PaymentRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.#ctor
     */
    static CreateWithMerchantInfo(details, methodData_, merchantInfo) {
        if (!PaymentRequest.HasProp("__IPaymentRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentRequestFactory.IID)
            PaymentRequest.__IPaymentRequestFactory := IPaymentRequestFactory(factoryPtr)
        }

        return PaymentRequest.__IPaymentRequestFactory.CreateWithMerchantInfo(details, methodData_, merchantInfo)
    }

    /**
     * Creates a [PaymentRequest](paymentrequest.md) object.
     * @param {PaymentDetails} details The details.
     * @param {IIterable<PaymentMethodData>} methodData_ The method data.
     * @param {PaymentMerchantInfo} merchantInfo The merchant information.
     * @param {PaymentOptions} options The options.
     * @returns {PaymentRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.#ctor
     */
    static CreateWithMerchantInfoAndOptions(details, methodData_, merchantInfo, options) {
        if (!PaymentRequest.HasProp("__IPaymentRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentRequestFactory.IID)
            PaymentRequest.__IPaymentRequestFactory := IPaymentRequestFactory(factoryPtr)
        }

        return PaymentRequest.__IPaymentRequestFactory.CreateWithMerchantInfoAndOptions(details, methodData_, merchantInfo, options)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The merchant info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.merchantinfo
     * @type {PaymentMerchantInfo} 
     */
    MerchantInfo {
        get => this.get_MerchantInfo()
    }

    /**
     * The details
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.details
     * @type {PaymentDetails} 
     */
    Details {
        get => this.get_Details()
    }

    /**
     * A collection of [PaymentMethodData](paymentmethoddata.md) classes. This collection represents the list of payment methods supported by the merchant.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.methoddata
     * @type {IVectorView<PaymentMethodData>} 
     */
    MethodData {
        get => this.get_MethodData()
    }

    /**
     * The options.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.options
     * @type {PaymentOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets the payment request ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequest.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PaymentMerchantInfo} 
     */
    get_MerchantInfo() {
        if (!this.HasProp("__IPaymentRequest")) {
            if ((queryResult := this.QueryInterface(IPaymentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequest := IPaymentRequest(outPtr)
        }

        return this.__IPaymentRequest.get_MerchantInfo()
    }

    /**
     * 
     * @returns {PaymentDetails} 
     */
    get_Details() {
        if (!this.HasProp("__IPaymentRequest")) {
            if ((queryResult := this.QueryInterface(IPaymentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequest := IPaymentRequest(outPtr)
        }

        return this.__IPaymentRequest.get_Details()
    }

    /**
     * 
     * @returns {IVectorView<PaymentMethodData>} 
     */
    get_MethodData() {
        if (!this.HasProp("__IPaymentRequest")) {
            if ((queryResult := this.QueryInterface(IPaymentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequest := IPaymentRequest(outPtr)
        }

        return this.__IPaymentRequest.get_MethodData()
    }

    /**
     * 
     * @returns {PaymentOptions} 
     */
    get_Options() {
        if (!this.HasProp("__IPaymentRequest")) {
            if ((queryResult := this.QueryInterface(IPaymentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequest := IPaymentRequest(outPtr)
        }

        return this.__IPaymentRequest.get_Options()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPaymentRequest2")) {
            if ((queryResult := this.QueryInterface(IPaymentRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequest2 := IPaymentRequest2(outPtr)
        }

        return this.__IPaymentRequest2.get_Id()
    }

;@endregion Instance Methods
}
