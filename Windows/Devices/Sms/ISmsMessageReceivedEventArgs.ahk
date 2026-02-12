#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmsTextMessage.ahk
#Include .\SmsBinaryMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsMessageReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsMessageReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{08e80a98-b8e5-41c1-a3d8-d3abfae22675}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextMessage", "get_BinaryMessage"]

    /**
     * @type {SmsTextMessage} 
     */
    TextMessage {
        get => this.get_TextMessage()
    }

    /**
     * @type {SmsBinaryMessage} 
     */
    BinaryMessage {
        get => this.get_BinaryMessage()
    }

    /**
     * 
     * @returns {SmsTextMessage} 
     */
    get_TextMessage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsTextMessage(value)
    }

    /**
     * 
     * @returns {SmsBinaryMessage} 
     */
    get_BinaryMessage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsBinaryMessage(value)
    }
}
