#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPaymentMediator.ahk
#Include .\IPaymentMediator2.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class is used to submit payment requests.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmediator
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class PaymentMediator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPaymentMediator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPaymentMediator.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new [PaymentMediator](paymentmediator.md) object.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Payments.PaymentMediator")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Gets the list of payment methods currently supported.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmediator.getsupportedmethodidsasync
     */
    GetSupportedMethodIdsAsync() {
        if (!this.HasProp("__IPaymentMediator")) {
            if ((queryResult := this.QueryInterface(IPaymentMediator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMediator := IPaymentMediator(outPtr)
        }

        return this.__IPaymentMediator.GetSupportedMethodIdsAsync()
    }

    /**
     * Submits a payment request.
     * @param {PaymentRequest} paymentRequest_ The payment request.
     * @returns {IAsyncOperation<PaymentRequestSubmitResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmediator.submitpaymentrequestasync
     */
    SubmitPaymentRequestAsync(paymentRequest_) {
        if (!this.HasProp("__IPaymentMediator")) {
            if ((queryResult := this.QueryInterface(IPaymentMediator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMediator := IPaymentMediator(outPtr)
        }

        return this.__IPaymentMediator.SubmitPaymentRequestAsync(paymentRequest_)
    }

    /**
     * Submits a payment request.
     * @param {PaymentRequest} paymentRequest_ The payment request.
     * @param {PaymentRequestChangedHandler} changeHandler 
     * @returns {IAsyncOperation<PaymentRequestSubmitResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmediator.submitpaymentrequestasync
     */
    SubmitPaymentRequestWithChangeHandlerAsync(paymentRequest_, changeHandler) {
        if (!this.HasProp("__IPaymentMediator")) {
            if ((queryResult := this.QueryInterface(IPaymentMediator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMediator := IPaymentMediator(outPtr)
        }

        return this.__IPaymentMediator.SubmitPaymentRequestWithChangeHandlerAsync(paymentRequest_, changeHandler)
    }

    /**
     * This method checks if a payment can be made on the paymentRequest.
     * @param {PaymentRequest} paymentRequest_ The payment request to check.
     * @returns {IAsyncOperation<PaymentCanMakePaymentResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.payments.paymentmediator.canmakepaymentasync
     */
    CanMakePaymentAsync(paymentRequest_) {
        if (!this.HasProp("__IPaymentMediator2")) {
            if ((queryResult := this.QueryInterface(IPaymentMediator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPaymentMediator2 := IPaymentMediator2(outPtr)
        }

        return this.__IPaymentMediator2.CanMakePaymentAsync(paymentRequest_)
    }

;@endregion Instance Methods
}
