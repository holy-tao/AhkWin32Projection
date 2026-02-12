#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentMerchantInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentMerchantInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentMerchantInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{9e89ced3-ccb7-4167-a8ec-e10ae96dbcd1}")

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
     * @param {Uri} uri_ 
     * @returns {PaymentMerchantInfo} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentMerchantInfo(result_)
    }
}
