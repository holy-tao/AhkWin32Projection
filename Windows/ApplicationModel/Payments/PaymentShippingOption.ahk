#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentShippingOption.ahk
#Include .\IPaymentShippingOptionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that contains information about a shipping option. This class reflects the [W3C PaymentShippingOption dictionary](https://www.w3.org/TR/payment-request/#paymentrequest-interface).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentShippingOption extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentShippingOption

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentShippingOption.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [PaymentShippingOption](paymentshippingoption.md) object.
     * @param {HSTRING} label The label.
     * @param {PaymentCurrencyAmount} amount The amount.
     * @returns {PaymentShippingOption} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.#ctor
     */
    static Create(label, amount) {
        if (!PaymentShippingOption.HasProp("__IPaymentShippingOptionFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentShippingOption")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentShippingOptionFactory.IID)
            PaymentShippingOption.__IPaymentShippingOptionFactory := IPaymentShippingOptionFactory(factoryPtr)
        }

        return PaymentShippingOption.__IPaymentShippingOptionFactory.Create(label, amount)
    }

    /**
     * Creates a new [PaymentShippingOption](paymentshippingoption.md) object.
     * @param {HSTRING} label The label.
     * @param {PaymentCurrencyAmount} amount The amount.
     * @param {Boolean} selected Whether this option is selected.
     * @returns {PaymentShippingOption} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.#ctor
     */
    static CreateWithSelected(label, amount, selected) {
        if (!PaymentShippingOption.HasProp("__IPaymentShippingOptionFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentShippingOption")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentShippingOptionFactory.IID)
            PaymentShippingOption.__IPaymentShippingOptionFactory := IPaymentShippingOptionFactory(factoryPtr)
        }

        return PaymentShippingOption.__IPaymentShippingOptionFactory.CreateWithSelected(label, amount, selected)
    }

    /**
     * Creates a new [PaymentShippingOption](paymentshippingoption.md) object.
     * @param {HSTRING} label The label.
     * @param {PaymentCurrencyAmount} amount The amount.
     * @param {Boolean} selected Whether this option is selected.
     * @param {HSTRING} tag The tag.
     * @returns {PaymentShippingOption} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.#ctor
     */
    static CreateWithSelectedAndTag(label, amount, selected, tag) {
        if (!PaymentShippingOption.HasProp("__IPaymentShippingOptionFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentShippingOption")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentShippingOptionFactory.IID)
            PaymentShippingOption.__IPaymentShippingOptionFactory := IPaymentShippingOptionFactory(factoryPtr)
        }

        return PaymentShippingOption.__IPaymentShippingOptionFactory.CreateWithSelectedAndTag(label, amount, selected, tag)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The label.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * The amount.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.amount
     * @type {PaymentCurrencyAmount} 
     */
    Amount {
        get => this.get_Amount()
        set => this.put_Amount(value)
    }

    /**
     * The tag.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Indicates whether this shipping option is selected. A merchant is required to check that only a single shipping option within a request is marked as selected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentshippingoption.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
        set => this.put_IsSelected(value)
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
    get_Label() {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.put_Label(value)
    }

    /**
     * 
     * @returns {PaymentCurrencyAmount} 
     */
    get_Amount() {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.get_Amount()
    }

    /**
     * 
     * @param {PaymentCurrencyAmount} value 
     * @returns {HRESULT} 
     */
    put_Amount(value) {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.put_Amount(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.get_Tag()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.put_Tag(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.get_IsSelected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSelected(value) {
        if (!this.HasProp("__IPaymentShippingOption")) {
            if ((queryResult := this.QueryInterface(IPaymentShippingOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentShippingOption := IPaymentShippingOption(outPtr)
        }

        return this.__IPaymentShippingOption.put_IsSelected(value)
    }

;@endregion Instance Methods
}
