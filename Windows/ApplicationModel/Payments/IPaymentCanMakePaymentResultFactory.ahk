#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentCanMakePaymentResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentCanMakePaymentResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentCanMakePaymentResultFactory
     * @type {Guid}
     */
    static IID => Guid("{bbdcaa3e-7d49-4f69-aa53-2a0f8164b7c9}")

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
     * @param {Integer} value 
     * @returns {PaymentCanMakePaymentResult} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(value) {
        result := ComCall(6, this, "int", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentCanMakePaymentResult(result_)
    }
}
