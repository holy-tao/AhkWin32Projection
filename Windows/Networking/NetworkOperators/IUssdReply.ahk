#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UssdMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IUssdReply extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUssdReply
     * @type {Guid}
     */
    static IID => Guid("{2f9acf82-2005-4d5d-bf81-2aba1b4be4a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResultCode", "get_Message"]

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * @type {UssdMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UssdMessage} 
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UssdMessage(value)
    }
}
