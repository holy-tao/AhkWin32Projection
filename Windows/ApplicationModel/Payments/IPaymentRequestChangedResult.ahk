#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PaymentDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentRequestChangedResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentRequestChangedResult
     * @type {Guid}
     */
    static IID => Guid("{df699e5c-16c4-47ad-9401-8440ec0757db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeAcceptedByMerchant", "put_ChangeAcceptedByMerchant", "get_Message", "put_Message", "get_UpdatedPaymentDetails", "put_UpdatedPaymentDetails"]

    /**
     * @type {Boolean} 
     */
    ChangeAcceptedByMerchant {
        get => this.get_ChangeAcceptedByMerchant()
        set => this.put_ChangeAcceptedByMerchant(value)
    }

    /**
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * @type {PaymentDetails} 
     */
    UpdatedPaymentDetails {
        get => this.get_UpdatedPaymentDetails()
        set => this.put_UpdatedPaymentDetails(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ChangeAcceptedByMerchant() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ChangeAcceptedByMerchant(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_Message(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PaymentDetails} 
     */
    get_UpdatedPaymentDetails() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetails(value)
    }

    /**
     * 
     * @param {PaymentDetails} value 
     * @returns {HRESULT} 
     */
    put_UpdatedPaymentDetails(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
