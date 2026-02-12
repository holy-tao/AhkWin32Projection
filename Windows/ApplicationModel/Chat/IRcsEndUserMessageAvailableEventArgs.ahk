#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RcsEndUserMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IRcsEndUserMessageAvailableEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsEndUserMessageAvailableEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2d45ae01-3f89-41ea-9702-9e9ed411aa98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsMessageAvailable", "get_Message"]

    /**
     * @type {Boolean} 
     */
    IsMessageAvailable {
        get => this.get_IsMessageAvailable()
    }

    /**
     * @type {RcsEndUserMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMessageAvailable() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {RcsEndUserMessage} 
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RcsEndUserMessage(result_)
    }
}
