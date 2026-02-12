#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentCurrencyAmount.ahk
#Include .\IPaymentCurrencyAmountFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class describes a monetary value associated with a purchase. For example, charges or discounts. This class reflects the [W3C PaymentCurrencyAmount dictionary](https://aka.ms/prapi#paymentcurrencyamount-dictionary).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcurrencyamount
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentCurrencyAmount extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentCurrencyAmount

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentCurrencyAmount.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [PaymentCurrencyAmount](paymentcurrencyamount.md) object
     * @param {HSTRING} value The monetary value. An exception will be thrown if this value doesn't match the following regex pattern.
     * ```
     * ^-?[0-9]+(\.[0-9]+)?$
     * ```
     * @param {HSTRING} currency The currency identifier. The default **CurrencySystem** is urn:iso:std:iso:4217.
     * 
     * > [!IMPORTANT]
     * > Validity of currency values are not enforced.
     * @returns {PaymentCurrencyAmount} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcurrencyamount.#ctor
     */
    static Create(value, currency) {
        if (!PaymentCurrencyAmount.HasProp("__IPaymentCurrencyAmountFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentCurrencyAmount")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentCurrencyAmountFactory.IID)
            PaymentCurrencyAmount.__IPaymentCurrencyAmountFactory := IPaymentCurrencyAmountFactory(factoryPtr)
        }

        return PaymentCurrencyAmount.__IPaymentCurrencyAmountFactory.Create(value, currency)
    }

    /**
     * Creates a new PaymentCurrencyAmount object.
     * @param {HSTRING} value The monetary value. An exception will be thrown if this value doesn't match the following regex pattern.
     * ```
     * ^-?[0-9]+(\.[0-9]+)?$
     * ```
     * @param {HSTRING} currency The currency. Valid values are determined by *currencySystem*. For example, if *currencySystem* is urn:iso:std:iso:4217 then **USD** is a valid currency value. 
     * 
     * > [!IMPORTANT]
     * > Validity of currency values are not enforced.
     * @param {HSTRING} currencySystem The currency system.
     * @returns {PaymentCurrencyAmount} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcurrencyamount.#ctor
     */
    static CreateWithCurrencySystem(value, currency, currencySystem) {
        if (!PaymentCurrencyAmount.HasProp("__IPaymentCurrencyAmountFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentCurrencyAmount")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentCurrencyAmountFactory.IID)
            PaymentCurrencyAmount.__IPaymentCurrencyAmountFactory := IPaymentCurrencyAmountFactory(factoryPtr)
        }

        return PaymentCurrencyAmount.__IPaymentCurrencyAmountFactory.CreateWithCurrencySystem(value, currency, currencySystem)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The currency identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcurrencyamount.currency
     * @type {HSTRING} 
     */
    Currency {
        get => this.get_Currency()
        set => this.put_Currency(value)
    }

    /**
     * The currency system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcurrencyamount.currencysystem
     * @type {HSTRING} 
     */
    CurrencySystem {
        get => this.get_CurrencySystem()
        set => this.put_CurrencySystem(value)
    }

    /**
     * The monetary value.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcurrencyamount.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
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
    get_Currency() {
        if (!this.HasProp("__IPaymentCurrencyAmount")) {
            if ((queryResult := this.QueryInterface(IPaymentCurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCurrencyAmount := IPaymentCurrencyAmount(outPtr)
        }

        return this.__IPaymentCurrencyAmount.get_Currency()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Currency(value) {
        if (!this.HasProp("__IPaymentCurrencyAmount")) {
            if ((queryResult := this.QueryInterface(IPaymentCurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCurrencyAmount := IPaymentCurrencyAmount(outPtr)
        }

        return this.__IPaymentCurrencyAmount.put_Currency(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrencySystem() {
        if (!this.HasProp("__IPaymentCurrencyAmount")) {
            if ((queryResult := this.QueryInterface(IPaymentCurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCurrencyAmount := IPaymentCurrencyAmount(outPtr)
        }

        return this.__IPaymentCurrencyAmount.get_CurrencySystem()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CurrencySystem(value) {
        if (!this.HasProp("__IPaymentCurrencyAmount")) {
            if ((queryResult := this.QueryInterface(IPaymentCurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCurrencyAmount := IPaymentCurrencyAmount(outPtr)
        }

        return this.__IPaymentCurrencyAmount.put_CurrencySystem(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IPaymentCurrencyAmount")) {
            if ((queryResult := this.QueryInterface(IPaymentCurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCurrencyAmount := IPaymentCurrencyAmount(outPtr)
        }

        return this.__IPaymentCurrencyAmount.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IPaymentCurrencyAmount")) {
            if ((queryResult := this.QueryInterface(IPaymentCurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCurrencyAmount := IPaymentCurrencyAmount(outPtr)
        }

        return this.__IPaymentCurrencyAmount.put_Value(value)
    }

;@endregion Instance Methods
}
