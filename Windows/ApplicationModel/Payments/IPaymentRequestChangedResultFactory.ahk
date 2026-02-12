#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentRequestChangedResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentRequestChangedResultFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentRequestChangedResultFactory
     * @type {Guid}
     */
    static IID => Guid("{08740f56-1d33-4431-814b-67ea24bf21db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithPaymentDetails"]

    /**
     * Create Extended Stored Procedures
     * @param {Boolean} changeAcceptedByMerchant 
     * @returns {PaymentRequestChangedResult} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(changeAcceptedByMerchant) {
        result := ComCall(6, this, "int", changeAcceptedByMerchant, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequestChangedResult(result_)
    }

    /**
     * 
     * @param {Boolean} changeAcceptedByMerchant 
     * @param {PaymentDetails} updatedPaymentDetails 
     * @returns {PaymentRequestChangedResult} 
     */
    CreateWithPaymentDetails(changeAcceptedByMerchant, updatedPaymentDetails) {
        result := ComCall(7, this, "int", changeAcceptedByMerchant, "ptr", updatedPaymentDetails, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequestChangedResult(result_)
    }
}
