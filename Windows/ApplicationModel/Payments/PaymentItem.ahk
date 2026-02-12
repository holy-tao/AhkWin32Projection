#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentItem.ahk
#Include .\IPaymentItemFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class represents a payment item. This class reflects the [W3C PaymentItem dictionary](https://aka.ms/prapi#paymentitem-dictionary).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentitem
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [PaymentItem](paymentitem.md) object. The [Pending](paymentitem_pending.md) property is set to false by default.
     * @param {HSTRING} label The label.
     * @param {PaymentCurrencyAmount} amount The amount.
     * @returns {PaymentItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentitem.#ctor
     */
    static Create(label, amount) {
        if (!PaymentItem.HasProp("__IPaymentItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentItemFactory.IID)
            PaymentItem.__IPaymentItemFactory := IPaymentItemFactory(factoryPtr)
        }

        return PaymentItem.__IPaymentItemFactory.Create(label, amount)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The label.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentitem.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * The amount.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentitem.amount
     * @type {PaymentCurrencyAmount} 
     */
    Amount {
        get => this.get_Amount()
        set => this.put_Amount(value)
    }

    /**
     * Indicates that the item may not be finalized, yet. For example, a merchant may initially quote the total cost assuming they will be shipping locally. But this value could change if the user provides an overseas shipping address, which would require the merchant to increase the price to account for international shipping.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentitem.pending
     * @type {Boolean} 
     */
    Pending {
        get => this.get_Pending()
        set => this.put_Pending(value)
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
        if (!this.HasProp("__IPaymentItem")) {
            if ((queryResult := this.QueryInterface(IPaymentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentItem := IPaymentItem(outPtr)
        }

        return this.__IPaymentItem.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IPaymentItem")) {
            if ((queryResult := this.QueryInterface(IPaymentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentItem := IPaymentItem(outPtr)
        }

        return this.__IPaymentItem.put_Label(value)
    }

    /**
     * 
     * @returns {PaymentCurrencyAmount} 
     */
    get_Amount() {
        if (!this.HasProp("__IPaymentItem")) {
            if ((queryResult := this.QueryInterface(IPaymentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentItem := IPaymentItem(outPtr)
        }

        return this.__IPaymentItem.get_Amount()
    }

    /**
     * 
     * @param {PaymentCurrencyAmount} value 
     * @returns {HRESULT} 
     */
    put_Amount(value) {
        if (!this.HasProp("__IPaymentItem")) {
            if ((queryResult := this.QueryInterface(IPaymentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentItem := IPaymentItem(outPtr)
        }

        return this.__IPaymentItem.put_Amount(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Pending() {
        if (!this.HasProp("__IPaymentItem")) {
            if ((queryResult := this.QueryInterface(IPaymentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentItem := IPaymentItem(outPtr)
        }

        return this.__IPaymentItem.get_Pending()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Pending(value) {
        if (!this.HasProp("__IPaymentItem")) {
            if ((queryResult := this.QueryInterface(IPaymentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentItem := IPaymentItem(outPtr)
        }

        return this.__IPaymentItem.put_Pending(value)
    }

;@endregion Instance Methods
}
