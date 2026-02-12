#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmsBinaryMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsReceivedEventDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsReceivedEventDetails2
     * @type {Guid}
     */
    static IID => Guid("{40e05c86-a7b4-4771-9ae7-0b5ffb12c03a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MessageClass", "get_BinaryMessage"]

    /**
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * @type {SmsBinaryMessage} 
     */
    BinaryMessage {
        get => this.get_BinaryMessage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageClass() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
