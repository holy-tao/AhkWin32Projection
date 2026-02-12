#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentToken.ahk
#Include .\PaymentShippingOption.ahk
#Include .\PaymentAddress.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentResponse extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentResponse
     * @type {Guid}
     */
    static IID => Guid("{e1389457-8bd2-4888-9fa8-97985545108e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaymentToken", "get_ShippingOption", "get_ShippingAddress", "get_PayerEmail", "get_PayerName", "get_PayerPhoneNumber", "CompleteAsync"]

    /**
     * @type {PaymentToken} 
     */
    PaymentToken {
        get => this.get_PaymentToken()
    }

    /**
     * @type {PaymentShippingOption} 
     */
    ShippingOption {
        get => this.get_ShippingOption()
    }

    /**
     * @type {PaymentAddress} 
     */
    ShippingAddress {
        get => this.get_ShippingAddress()
    }

    /**
     * @type {HSTRING} 
     */
    PayerEmail {
        get => this.get_PayerEmail()
    }

    /**
     * @type {HSTRING} 
     */
    PayerName {
        get => this.get_PayerName()
    }

    /**
     * @type {HSTRING} 
     */
    PayerPhoneNumber {
        get => this.get_PayerPhoneNumber()
    }

    /**
     * 
     * @returns {PaymentToken} 
     */
    get_PaymentToken() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentToken(value)
    }

    /**
     * 
     * @returns {PaymentShippingOption} 
     */
    get_ShippingOption() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentShippingOption(value)
    }

    /**
     * 
     * @returns {PaymentAddress} 
     */
    get_ShippingAddress() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerEmail() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayerName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
     * @param {Integer} status_ 
     * @returns {IAsyncAction} 
     */
    CompleteAsync(status_) {
        result := ComCall(12, this, "int", status_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
