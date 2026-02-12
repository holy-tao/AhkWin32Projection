#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrencyAmount.ahk
#Include .\ICurrencyAmountFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Defines properties for specifying a currency and its amount.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyamount
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class CurrencyAmount extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICurrencyAmount

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICurrencyAmount.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [CurrencyAmount](currencyamount.md) object (in the specified amount and currency).
     * @param {HSTRING} amount A string containing a decimal number in the invariant culture format (for example, a culture-insensitive amount such as  "100.00").
     * @param {HSTRING} currency A string containing a [CurrencyIdentifiers](currencyidentifiers.md) value (such as [USD](currencyidentifiers_usd.md)), other **ISO 4217** alphabetic currency code, "vendor-specific" code prefixed with *"X-"* (for example, *"X-ContosoPoints"*) or other currency name (including cryptocurrency, such as *"Bitcoin"* or *"TRON"*).
     * @returns {CurrencyAmount} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyamount.#ctor
     */
    static Create(amount, currency) {
        if (!CurrencyAmount.HasProp("__ICurrencyAmountFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.CurrencyAmount")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrencyAmountFactory.IID)
            CurrencyAmount.__ICurrencyAmountFactory := ICurrencyAmountFactory(factoryPtr)
        }

        return CurrencyAmount.__ICurrencyAmountFactory.Create(amount, currency)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * An amount.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyamount.amount
     * @type {HSTRING} 
     */
    Amount {
        get => this.get_Amount()
    }

    /**
     * A currency in general use in a specific country.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.currencyamount.currency
     * @type {HSTRING} 
     */
    Currency {
        get => this.get_Currency()
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
    get_Amount() {
        if (!this.HasProp("__ICurrencyAmount")) {
            if ((queryResult := this.QueryInterface(ICurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyAmount := ICurrencyAmount(outPtr)
        }

        return this.__ICurrencyAmount.get_Amount()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Currency() {
        if (!this.HasProp("__ICurrencyAmount")) {
            if ((queryResult := this.QueryInterface(ICurrencyAmount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrencyAmount := ICurrencyAmount(outPtr)
        }

        return this.__ICurrencyAmount.get_Currency()
    }

;@endregion Instance Methods
}
