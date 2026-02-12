#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PaymentToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentTokenFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentTokenFactory
     * @type {Guid}
     */
    static IID => Guid("{988cd7aa-4753-4904-8373-dd7b08b995c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithJsonDetails"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} paymentMethodId 
     * @returns {PaymentToken} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(paymentMethodId) {
        if(paymentMethodId is String) {
            pin := HSTRING.Create(paymentMethodId)
            paymentMethodId := pin.Value
        }
        paymentMethodId := paymentMethodId is Win32Handle ? NumGet(paymentMethodId, "ptr") : paymentMethodId

        result := ComCall(6, this, "ptr", paymentMethodId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentToken(result_)
    }

    /**
     * 
     * @param {HSTRING} paymentMethodId 
     * @param {HSTRING} jsonDetails 
     * @returns {PaymentToken} 
     */
    CreateWithJsonDetails(paymentMethodId, jsonDetails) {
        if(paymentMethodId is String) {
            pin := HSTRING.Create(paymentMethodId)
            paymentMethodId := pin.Value
        }
        paymentMethodId := paymentMethodId is Win32Handle ? NumGet(paymentMethodId, "ptr") : paymentMethodId
        if(jsonDetails is String) {
            pin := HSTRING.Create(jsonDetails)
            jsonDetails := pin.Value
        }
        jsonDetails := jsonDetails is Win32Handle ? NumGet(jsonDetails, "ptr") : jsonDetails

        result := ComCall(7, this, "ptr", paymentMethodId, "ptr", jsonDetails, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentToken(result_)
    }
}
