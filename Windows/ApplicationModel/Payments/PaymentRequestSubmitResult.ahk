#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentRequestSubmitResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class containing the payment request submission result.
 * @remarks
 * An object of this class is created and retrieved through the [PaymentMediator.SubmitPaymentRequestAsync](paymentmediator_submitpaymentrequestasync_16520403.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestsubmitresult
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentRequestSubmitResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentRequestSubmitResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentRequestSubmitResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of the submission.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestsubmitresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * The response from the payment request submission. This will be non-null if [Status](paymentrequestsubmitresult_status.md) is equal to [PaymentRequestStatus.Succeeded](paymentrequeststatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentrequestsubmitresult.response
     * @type {PaymentResponse} 
     */
    Response {
        get => this.get_Response()
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
        if (!this.HasProp("__IPaymentRequestSubmitResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestSubmitResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestSubmitResult := IPaymentRequestSubmitResult(outPtr)
        }

        return this.__IPaymentRequestSubmitResult.get_Status()
    }

    /**
     * 
     * @returns {PaymentResponse} 
     */
    get_Response() {
        if (!this.HasProp("__IPaymentRequestSubmitResult")) {
            if ((queryResult := this.QueryInterface(IPaymentRequestSubmitResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentRequestSubmitResult := IPaymentRequestSubmitResult(outPtr)
        }

        return this.__IPaymentRequestSubmitResult.get_Response()
    }

;@endregion Instance Methods
}
