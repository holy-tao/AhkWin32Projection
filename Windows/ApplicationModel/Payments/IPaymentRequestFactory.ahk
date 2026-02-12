#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentRequestFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{3e8a79dc-6b74-42d3-b103-f0de35fb1848}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithMerchantInfo", "CreateWithMerchantInfoAndOptions"]

    /**
     * Create Extended Stored Procedures
     * @param {PaymentDetails} details 
     * @param {IIterable<PaymentMethodData>} methodData_ 
     * @returns {PaymentRequest} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(details, methodData_) {
        result := ComCall(6, this, "ptr", details, "ptr", methodData_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequest(result_)
    }

    /**
     * 
     * @param {PaymentDetails} details 
     * @param {IIterable<PaymentMethodData>} methodData_ 
     * @param {PaymentMerchantInfo} merchantInfo 
     * @returns {PaymentRequest} 
     */
    CreateWithMerchantInfo(details, methodData_, merchantInfo) {
        result := ComCall(7, this, "ptr", details, "ptr", methodData_, "ptr", merchantInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequest(result_)
    }

    /**
     * 
     * @param {PaymentDetails} details 
     * @param {IIterable<PaymentMethodData>} methodData_ 
     * @param {PaymentMerchantInfo} merchantInfo 
     * @param {PaymentOptions} options 
     * @returns {PaymentRequest} 
     */
    CreateWithMerchantInfoAndOptions(details, methodData_, merchantInfo, options) {
        result := ComCall(8, this, "ptr", details, "ptr", methodData_, "ptr", merchantInfo, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequest(result_)
    }
}
