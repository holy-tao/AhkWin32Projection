#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageBlockingStatic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageBlockingStatic
     * @type {Guid}
     */
    static IID => Guid("{f6b9a380-cdea-11e4-8830-0800200c9a66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MarkMessageAsBlockedAsync"]

    /**
     * 
     * @param {HSTRING} localChatMessageId 
     * @param {Boolean} blocked 
     * @returns {IAsyncAction} 
     */
    MarkMessageAsBlockedAsync(localChatMessageId, blocked) {
        if(localChatMessageId is String) {
            pin := HSTRING.Create(localChatMessageId)
            localChatMessageId := pin.Value
        }
        localChatMessageId := localChatMessageId is Win32Handle ? NumGet(localChatMessageId, "ptr") : localChatMessageId

        result := ComCall(6, this, "ptr", localChatMessageId, "int", blocked, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }
}
