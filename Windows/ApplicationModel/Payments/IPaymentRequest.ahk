#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentMerchantInfo.ahk
#Include .\PaymentDetails.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PaymentMethodData.ahk
#Include .\PaymentOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentRequest
     * @type {Guid}
     */
    static IID => Guid("{b74942e1-ed7b-47eb-bc08-78cc5d6896b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MerchantInfo", "get_Details", "get_MethodData", "get_Options"]

    /**
     * @type {PaymentMerchantInfo} 
     */
    MerchantInfo {
        get => this.get_MerchantInfo()
    }

    /**
     * @type {PaymentDetails} 
     */
    Details {
        get => this.get_Details()
    }

    /**
     * @type {IVectorView<PaymentMethodData>} 
     */
    MethodData {
        get => this.get_MethodData()
    }

    /**
     * @type {PaymentOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * 
     * @returns {PaymentMerchantInfo} 
     */
    get_MerchantInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentMerchantInfo(value)
    }

    /**
     * 
     * @returns {PaymentDetails} 
     */
    get_Details() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetails(value)
    }

    /**
     * 
     * @returns {IVectorView<PaymentMethodData>} 
     */
    get_MethodData() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PaymentMethodData, value)
    }

    /**
     * 
     * @returns {PaymentOptions} 
     */
    get_Options() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentOptions(value)
    }
}
