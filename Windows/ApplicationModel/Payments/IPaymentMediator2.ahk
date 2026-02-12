#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PaymentCanMakePaymentResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentMediator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentMediator2
     * @type {Guid}
     */
    static IID => Guid("{ceef98f1-e407-4128-8e73-d93d5f822786}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanMakePaymentAsync"]

    /**
     * 
     * @param {PaymentRequest} paymentRequest_ 
     * @returns {IAsyncOperation<PaymentCanMakePaymentResult>} 
     */
    CanMakePaymentAsync(paymentRequest_) {
        result := ComCall(6, this, "ptr", paymentRequest_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PaymentCanMakePaymentResult, result_)
    }
}
