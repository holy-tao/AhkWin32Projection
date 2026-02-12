#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentAddress.ahk
#Include .\PaymentShippingOption.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentRequestChangedArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentRequestChangedArgs
     * @type {Guid}
     */
    static IID => Guid("{c6145e44-cd8b-4be4-b555-27c99194c0c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeKind", "get_ShippingAddress", "get_SelectedShippingOption", "Acknowledge"]

    /**
     * @type {Integer} 
     */
    ChangeKind {
        get => this.get_ChangeKind()
    }

    /**
     * @type {PaymentAddress} 
     */
    ShippingAddress {
        get => this.get_ShippingAddress()
    }

    /**
     * @type {PaymentShippingOption} 
     */
    SelectedShippingOption {
        get => this.get_SelectedShippingOption()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PaymentAddress} 
     */
    get_ShippingAddress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentAddress(value)
    }

    /**
     * 
     * @returns {PaymentShippingOption} 
     */
    get_SelectedShippingOption() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentShippingOption(value)
    }

    /**
     * 
     * @param {PaymentRequestChangedResult} changeResult 
     * @returns {HRESULT} 
     */
    Acknowledge(changeResult) {
        result := ComCall(9, this, "ptr", changeResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
