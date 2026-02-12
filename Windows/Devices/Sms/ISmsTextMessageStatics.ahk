#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmsTextMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsTextMessageStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsTextMessageStatics
     * @type {Guid}
     */
    static IID => Guid("{7f68c5ed-3ccc-47a3-8c55-380d3b010892}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromBinaryMessage", "FromBinaryData"]

    /**
     * 
     * @param {SmsBinaryMessage} binaryMessage 
     * @returns {SmsTextMessage} 
     */
    FromBinaryMessage(binaryMessage) {
        result := ComCall(6, this, "ptr", binaryMessage, "ptr*", &textMessage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsTextMessage(textMessage)
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {SmsTextMessage} 
     */
    FromBinaryData(format, value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "int", format, "uint", value_length, valueMarshal, value, "ptr*", &textMessage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsTextMessage(textMessage)
    }
}
