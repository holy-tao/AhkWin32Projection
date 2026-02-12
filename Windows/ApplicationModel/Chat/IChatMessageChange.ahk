#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ChatMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageChange extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageChange
     * @type {Guid}
     */
    static IID => Guid("{1c18c355-421e-54b8-6d38-6b3a6c82fccc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeType", "get_Message"]

    /**
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * @type {ChatMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ChatMessage} 
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessage(value)
    }
}
