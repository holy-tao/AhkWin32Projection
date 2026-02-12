#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PaymentRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class IPaymentAppCanMakePaymentTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentAppCanMakePaymentTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{0ce201f0-8b93-4eb6-8c46-2e4a6c6a26f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request", "ReportCanMakePaymentResult"]

    /**
     * @type {PaymentRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {PaymentRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequest(result_)
    }

    /**
     * 
     * @param {PaymentCanMakePaymentResult} value 
     * @returns {HRESULT} 
     */
    ReportCanMakePaymentResult(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
