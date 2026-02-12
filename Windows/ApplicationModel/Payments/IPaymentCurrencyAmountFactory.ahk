#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PaymentCurrencyAmount.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentCurrencyAmountFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentCurrencyAmountFactory
     * @type {Guid}
     */
    static IID => Guid("{3257d338-140c-4575-8535-f773178c09a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithCurrencySystem"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} value 
     * @param {HSTRING} currency 
     * @returns {PaymentCurrencyAmount} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(value, currency) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value
        if(currency is String) {
            pin := HSTRING.Create(currency)
            currency := pin.Value
        }
        currency := currency is Win32Handle ? NumGet(currency, "ptr") : currency

        result := ComCall(6, this, "ptr", value, "ptr", currency, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentCurrencyAmount(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @param {HSTRING} currency 
     * @param {HSTRING} currencySystem 
     * @returns {PaymentCurrencyAmount} 
     */
    CreateWithCurrencySystem(value, currency, currencySystem) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value
        if(currency is String) {
            pin := HSTRING.Create(currency)
            currency := pin.Value
        }
        currency := currency is Win32Handle ? NumGet(currency, "ptr") : currency
        if(currencySystem is String) {
            pin := HSTRING.Create(currencySystem)
            currencySystem := pin.Value
        }
        currencySystem := currencySystem is Win32Handle ? NumGet(currencySystem, "ptr") : currencySystem

        result := ComCall(7, this, "ptr", value, "ptr", currency, "ptr", currencySystem, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentCurrencyAmount(result_)
    }
}
