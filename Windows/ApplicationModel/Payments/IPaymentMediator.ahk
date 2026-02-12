#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PaymentRequestSubmitResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentMediator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentMediator
     * @type {Guid}
     */
    static IID => Guid("{fb0ee829-ec0c-449a-83da-7ae3073365a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedMethodIdsAsync", "SubmitPaymentRequestAsync", "SubmitPaymentRequestWithChangeHandlerAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    GetSupportedMethodIdsAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), result_)
    }

    /**
     * 
     * @param {PaymentRequest} paymentRequest_ 
     * @returns {IAsyncOperation<PaymentRequestSubmitResult>} 
     */
    SubmitPaymentRequestAsync(paymentRequest_) {
        result := ComCall(7, this, "ptr", paymentRequest_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PaymentRequestSubmitResult, result_)
    }

    /**
     * 
     * @param {PaymentRequest} paymentRequest_ 
     * @param {PaymentRequestChangedHandler} changeHandler 
     * @returns {IAsyncOperation<PaymentRequestSubmitResult>} 
     */
    SubmitPaymentRequestWithChangeHandlerAsync(paymentRequest_, changeHandler) {
        result := ComCall(8, this, "ptr", paymentRequest_, "ptr", changeHandler, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PaymentRequestSubmitResult, result_)
    }
}
