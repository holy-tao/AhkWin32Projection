#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PaymentShippingOption.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentShippingOptionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentShippingOptionFactory
     * @type {Guid}
     */
    static IID => Guid("{5de5f917-b2d7-446b-9d73-6123fbca3bc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithSelected", "CreateWithSelectedAndTag"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} label 
     * @param {PaymentCurrencyAmount} amount 
     * @returns {PaymentShippingOption} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(label, amount) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(6, this, "ptr", label, "ptr", amount, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentShippingOption(result_)
    }

    /**
     * 
     * @param {HSTRING} label 
     * @param {PaymentCurrencyAmount} amount 
     * @param {Boolean} selected 
     * @returns {PaymentShippingOption} 
     */
    CreateWithSelected(label, amount, selected) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(7, this, "ptr", label, "ptr", amount, "int", selected, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentShippingOption(result_)
    }

    /**
     * 
     * @param {HSTRING} label 
     * @param {PaymentCurrencyAmount} amount 
     * @param {Boolean} selected 
     * @param {HSTRING} tag 
     * @returns {PaymentShippingOption} 
     */
    CreateWithSelectedAndTag(label, amount, selected, tag) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag

        result := ComCall(8, this, "ptr", label, "ptr", amount, "int", selected, "ptr", tag, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentShippingOption(result_)
    }
}
