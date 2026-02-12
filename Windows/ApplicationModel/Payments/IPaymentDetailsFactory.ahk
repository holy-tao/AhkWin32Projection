#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentDetailsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentDetailsFactory
     * @type {Guid}
     */
    static IID => Guid("{cfe8afee-c0ea-4ca1-8bc7-6de67b1f3763}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithDisplayItems"]

    /**
     * Create Extended Stored Procedures
     * @param {PaymentItem} total 
     * @returns {PaymentDetails} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(total) {
        result := ComCall(6, this, "ptr", total, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetails(result_)
    }

    /**
     * 
     * @param {PaymentItem} total 
     * @param {IIterable<PaymentItem>} displayItems 
     * @returns {PaymentDetails} 
     */
    CreateWithDisplayItems(total, displayItems) {
        result := ComCall(7, this, "ptr", total, "ptr", displayItems, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetails(result_)
    }
}
