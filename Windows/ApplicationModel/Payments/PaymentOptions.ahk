#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class containing payment options. This class reflects the [W3C PaymentOptions dictionary](https://www.w3.org/TR/payment-request/#paymentoptions-dictionary).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptions
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether to request the payer email.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptions.requestpayeremail
     * @type {Integer} 
     */
    RequestPayerEmail {
        get => this.get_RequestPayerEmail()
        set => this.put_RequestPayerEmail(value)
    }

    /**
     * Indicates whether to request the payer name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptions.requestpayername
     * @type {Integer} 
     */
    RequestPayerName {
        get => this.get_RequestPayerName()
        set => this.put_RequestPayerName(value)
    }

    /**
     * Indicates whether to request the payer phone number.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptions.requestpayerphonenumber
     * @type {Integer} 
     */
    RequestPayerPhoneNumber {
        get => this.get_RequestPayerPhoneNumber()
        set => this.put_RequestPayerPhoneNumber(value)
    }

    /**
     * Indicates whether to request shipping. If this value is set to true, then [PaymentDetails.ShippingOptions](paymentdetails_shippingoptions.md) must not be empty.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptions.requestshipping
     * @type {Boolean} 
     */
    RequestShipping {
        get => this.get_RequestShipping()
        set => this.put_RequestShipping(value)
    }

    /**
     * The shipping type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentoptions.shippingtype
     * @type {Integer} 
     */
    ShippingType {
        get => this.get_ShippingType()
        set => this.put_ShippingType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [PaymentOptions](paymentoptions.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestPayerEmail() {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.get_RequestPayerEmail()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestPayerEmail(value) {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.put_RequestPayerEmail(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestPayerName() {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.get_RequestPayerName()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestPayerName(value) {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.put_RequestPayerName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestPayerPhoneNumber() {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.get_RequestPayerPhoneNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestPayerPhoneNumber(value) {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.put_RequestPayerPhoneNumber(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequestShipping() {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.get_RequestShipping()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequestShipping(value) {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.put_RequestShipping(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShippingType() {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.get_ShippingType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ShippingType(value) {
        if (!this.HasProp("__IPaymentOptions")) {
            if ((queryResult := this.QueryInterface(IPaymentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentOptions := IPaymentOptions(outPtr)
        }

        return this.__IPaymentOptions.put_ShippingType(value)
    }

;@endregion Instance Methods
}
