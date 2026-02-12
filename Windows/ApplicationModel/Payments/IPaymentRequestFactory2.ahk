#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PaymentRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentRequestFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentRequestFactory2
     * @type {Guid}
     */
    static IID => Guid("{e6ce1325-a506-4372-b7ef-1a031d5662d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithMerchantInfoOptionsAndId"]

    /**
     * 
     * @param {PaymentDetails} details 
     * @param {IIterable<PaymentMethodData>} methodData_ 
     * @param {PaymentMerchantInfo} merchantInfo 
     * @param {PaymentOptions} options 
     * @param {HSTRING} id 
     * @returns {PaymentRequest} 
     */
    CreateWithMerchantInfoOptionsAndId(details, methodData_, merchantInfo, options, id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", details, "ptr", methodData_, "ptr", merchantInfo, "ptr", options, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentRequest(result_)
    }
}
