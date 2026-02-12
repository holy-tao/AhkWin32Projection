#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentAppCanMakePaymentTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates a new PaymentAppCanMakePaymentTriggerDetails.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappcanmakepaymenttriggerdetails
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class PaymentAppCanMakePaymentTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentAppCanMakePaymentTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentAppCanMakePaymentTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the payment request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappcanmakepaymenttriggerdetails.request
     * @type {PaymentRequest} 
     */
    Request {
        get => this.get_Request()
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
    get_Request() {
        if (!this.HasProp("__IPaymentAppCanMakePaymentTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentAppCanMakePaymentTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAppCanMakePaymentTriggerDetails := IPaymentAppCanMakePaymentTriggerDetails(outPtr)
        }

        return this.__IPaymentAppCanMakePaymentTriggerDetails.get_Request()
    }

    /**
     * Reports the status of whether the payment can be made.
     * @param {PaymentCanMakePaymentResult} value The value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.provider.paymentappcanmakepaymenttriggerdetails.reportcanmakepaymentresult
     */
    ReportCanMakePaymentResult(value) {
        if (!this.HasProp("__IPaymentAppCanMakePaymentTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPaymentAppCanMakePaymentTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentAppCanMakePaymentTriggerDetails := IPaymentAppCanMakePaymentTriggerDetails(outPtr)
        }

        return this.__IPaymentAppCanMakePaymentTriggerDetails.ReportCanMakePaymentResult(value)
    }

;@endregion Instance Methods
}
