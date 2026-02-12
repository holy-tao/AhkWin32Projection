#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\CurrencyAmount.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICurrencyAmountFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrencyAmountFactory
     * @type {Guid}
     */
    static IID => Guid("{48d7168f-ef3b-4aee-a6a1-4b036fe03ff0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} amount 
     * @param {HSTRING} currency 
     * @returns {CurrencyAmount} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(amount, currency) {
        if(amount is String) {
            pin := HSTRING.Create(amount)
            amount := pin.Value
        }
        amount := amount is Win32Handle ? NumGet(amount, "ptr") : amount
        if(currency is String) {
            pin := HSTRING.Create(currency)
            currency := pin.Value
        }
        currency := currency is Win32Handle ? NumGet(currency, "ptr") : currency

        result := ComCall(6, this, "ptr", amount, "ptr", currency, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CurrencyAmount(result_)
    }
}
