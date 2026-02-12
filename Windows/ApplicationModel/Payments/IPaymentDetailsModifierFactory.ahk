#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentDetailsModifier.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentDetailsModifierFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentDetailsModifierFactory
     * @type {Guid}
     */
    static IID => Guid("{79005286-54de-429c-9e4f-5dce6e10ebce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithAdditionalDisplayItems", "CreateWithAdditionalDisplayItemsAndJsonData"]

    /**
     * Create Extended Stored Procedures
     * @param {IIterable<HSTRING>} supportedMethodIds 
     * @param {PaymentItem} total 
     * @returns {PaymentDetailsModifier} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(supportedMethodIds, total) {
        result := ComCall(6, this, "ptr", supportedMethodIds, "ptr", total, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetailsModifier(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} supportedMethodIds 
     * @param {PaymentItem} total 
     * @param {IIterable<PaymentItem>} additionalDisplayItems 
     * @returns {PaymentDetailsModifier} 
     */
    CreateWithAdditionalDisplayItems(supportedMethodIds, total, additionalDisplayItems) {
        result := ComCall(7, this, "ptr", supportedMethodIds, "ptr", total, "ptr", additionalDisplayItems, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetailsModifier(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} supportedMethodIds 
     * @param {PaymentItem} total 
     * @param {IIterable<PaymentItem>} additionalDisplayItems 
     * @param {HSTRING} jsonData 
     * @returns {PaymentDetailsModifier} 
     */
    CreateWithAdditionalDisplayItemsAndJsonData(supportedMethodIds, total, additionalDisplayItems, jsonData) {
        if(jsonData is String) {
            pin := HSTRING.Create(jsonData)
            jsonData := pin.Value
        }
        jsonData := jsonData is Win32Handle ? NumGet(jsonData, "ptr") : jsonData

        result := ComCall(8, this, "ptr", supportedMethodIds, "ptr", total, "ptr", additionalDisplayItems, "ptr", jsonData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentDetailsModifier(result_)
    }
}
