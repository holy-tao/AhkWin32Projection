#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentRequestChangedArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class containing arguments from the [PaymentRequestChanged](paymentrequestchangedhandler.md) delegate.
 * @remarks
 * An object of this class is created and retrieved through the [PaymentRequestChangedHandler](paymentrequestchangedhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedargs
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequestChangedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentRequestChangedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentRequestChangedArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The change kind.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedargs.changekind
     * @type {Integer} 
     */
    ChangeKind {
        get => this.get_ChangeKind()
    }

    /**
     * The shipping address. This will be non-null if [ChangeKind](paymentrequestchangedargs_changekind.md) is set to [PaymentRequestChangeKind.ShippingAddress](paymentrequestchangekind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedargs.shippingaddress
     * @type {PaymentAddress} 
     */
    ShippingAddress {
        get => this.get_ShippingAddress()
    }

    /**
     * The selected shipping option. This will be non-null if [ChangeKind](paymentrequestchangedargs_changekind.md) is set to [PaymentRequestChangeKind.ShippingOption](paymentrequestchangekind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedargs.selectedshippingoption
     * @type {PaymentShippingOption} 
     */
    SelectedShippingOption {
        get => this.get_SelectedShippingOption()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeKind() {
        if (!this.HasProp("__IPaymentRequestChangedArgs")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedArgs := IPaymentRequestChangedArgs(outPtr)
        }

        return this.__IPaymentRequestChangedArgs.get_ChangeKind()
    }

    /**
     * 
     * @returns {PaymentAddress} 
     */
    get_ShippingAddress() {
        if (!this.HasProp("__IPaymentRequestChangedArgs")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedArgs := IPaymentRequestChangedArgs(outPtr)
        }

        return this.__IPaymentRequestChangedArgs.get_ShippingAddress()
    }

    /**
     * 
     * @returns {PaymentShippingOption} 
     */
    get_SelectedShippingOption() {
        if (!this.HasProp("__IPaymentRequestChangedArgs")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedArgs := IPaymentRequestChangedArgs(outPtr)
        }

        return this.__IPaymentRequestChangedArgs.get_SelectedShippingOption()
    }

    /**
     * This method is called by the merchant to confirm that it has received and processed the changes to the payment request. And it provides a way for the merchant to update the details of the request, if required.
     * @param {PaymentRequestChangedResult} changeResult The change result.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestchangedargs.acknowledge
     */
    Acknowledge(changeResult) {
        if (!this.HasProp("__IPaymentRequestChangedArgs")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestChangedArgs := IPaymentRequestChangedArgs(outPtr)
        }

        return this.__IPaymentRequestChangedArgs.Acknowledge(changeResult)
    }

;@endregion Instance Methods
}
