#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentCanMakePaymentResult.ahk
#Include .\IPaymentCanMakePaymentResultFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class serves as a result of the [CanMakePaymentsAsync](paymentmediator_canmakepaymentasync_2038017003.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcanmakepaymentresult
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentCanMakePaymentResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentCanMakePaymentResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentCanMakePaymentResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new PaymentCanMakePaymentResult object.
     * @param {Integer} value The status value.
     * @returns {PaymentCanMakePaymentResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcanmakepaymentresult.#ctor
     */
    static Create(value) {
        if (!PaymentCanMakePaymentResult.HasProp("__IPaymentCanMakePaymentResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentCanMakePaymentResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPaymentCanMakePaymentResultFactory.IID)
            PaymentCanMakePaymentResult.__IPaymentCanMakePaymentResultFactory := IPaymentCanMakePaymentResultFactory(factoryPtr)
        }

        return PaymentCanMakePaymentResult.__IPaymentCanMakePaymentResultFactory.Create(value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the status of whether a payment can be made.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentcanmakepaymentresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
    get_Status() {
        if (!this.HasProp("__IPaymentCanMakePaymentResult")) {
            if ((queryResult := this.QueryInterface(IPaymentCanMakePaymentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentCanMakePaymentResult := IPaymentCanMakePaymentResult(outPtr)
        }

        return this.__IPaymentCanMakePaymentResult.get_Status()
    }

;@endregion Instance Methods
}
