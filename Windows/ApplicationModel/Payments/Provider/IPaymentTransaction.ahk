#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PaymentRequest.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\PaymentRequestChangedResult.ahk
#Include .\PaymentTransactionAcceptResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments.Provider
 * @version WindowsRuntime 1.4
 */
class IPaymentTransaction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentTransaction
     * @type {Guid}
     */
    static IID => Guid("{62581da0-26a5-4e9b-a6eb-66606cf001d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaymentRequest", "get_PayerEmail", "put_PayerEmail", "get_PayerName", "put_PayerName", "get_PayerPhoneNumber", "put_PayerPhoneNumber", "UpdateShippingAddressAsync", "UpdateSelectedShippingOptionAsync", "AcceptAsync", "Reject"]

    /**
     * @type {PaymentRequest} 
     */
    PaymentRequest {
        get => this.get_PaymentRequest()
    }

    /**
     * @type {HSTRING} 
     */
    PayerEmail {
        get => this.get_PayerEmail()
        set => this.put_PayerEmail(value)
    }

    /**
     * @type {HSTRING} 
     */
    PayerName {
        get => this.get_PayerName()
        set => this.put_PayerName(value)
    }

    /**
     * @type {HSTRING} 
     */
    PayerPhoneNumber {
        get => this.get_PayerPhoneNumber()
        set => this.put_PayerPhoneNumber(value)
    }

    /**
     * 
     * @returns {PaymentRequest} 
     */
    get_PaymentRequest() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequest(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerEmail() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayerEmail(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayerName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerPhoneNumber() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayerPhoneNumber(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PaymentAddress} shippingAddress 
     * @returns {IAsyncOperation<PaymentRequestChangedResult>} 
     */
    UpdateShippingAddressAsync(shippingAddress) {
        result := ComCall(13, this, "ptr", shippingAddress, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PaymentRequestChangedResult, result_)
    }

    /**
     * 
     * @param {PaymentShippingOption} selectedShippingOption 
     * @returns {IAsyncOperation<PaymentRequestChangedResult>} 
     */
    UpdateSelectedShippingOptionAsync(selectedShippingOption) {
        result := ComCall(14, this, "ptr", selectedShippingOption, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PaymentRequestChangedResult, result_)
    }

    /**
     * 
     * @param {PaymentToken} paymentToken_ 
     * @returns {IAsyncOperation<PaymentTransactionAcceptResult>} 
     */
    AcceptAsync(paymentToken_) {
        result := ComCall(15, this, "ptr", paymentToken_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PaymentTransactionAcceptResult, result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
