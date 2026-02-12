#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PaymentMethodData.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Payments
 * @version WindowsRuntime 1.4
 */
class IPaymentMethodDataFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaymentMethodDataFactory
     * @type {Guid}
     */
    static IID => Guid("{8addd27f-9baa-4a82-8342-a8210992a36b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithJsonData"]

    /**
     * Create Extended Stored Procedures
     * @param {IIterable<HSTRING>} supportedMethodIds 
     * @returns {PaymentMethodData} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(supportedMethodIds) {
        result := ComCall(6, this, "ptr", supportedMethodIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentMethodData(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} supportedMethodIds 
     * @param {HSTRING} jsonData 
     * @returns {PaymentMethodData} 
     */
    CreateWithJsonData(supportedMethodIds, jsonData) {
        if(jsonData is String) {
            pin := HSTRING.Create(jsonData)
            jsonData := pin.Value
        }
        jsonData := jsonData is Win32Handle ? NumGet(jsonData, "ptr") : jsonData

        result := ComCall(7, this, "ptr", supportedMethodIds, "ptr", jsonData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PaymentMethodData(result_)
    }
}
