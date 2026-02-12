#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ChatMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageNotificationTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageNotificationTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{fd344dfb-3063-4e17-8586-c6c08262e6c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChatMessage"]

    /**
     * @type {ChatMessage} 
     */
    ChatMessage {
        get => this.get_ChatMessage()
    }

    /**
     * 
     * @returns {ChatMessage} 
     */
    get_ChatMessage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessage(value)
    }
}
