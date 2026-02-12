#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageBlockingStatic.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for blocking messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageblocking
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageBlocking extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously marks a message as blocked or unblocked.
     * @param {HSTRING} localChatMessageId The ID of the message to block.
     * @param {Boolean} blocked TRUE if the message should be blocked, FALSE if it should be unblocked.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessageblocking.markmessageasblockedasync
     */
    static MarkMessageAsBlockedAsync(localChatMessageId, blocked) {
        if (!ChatMessageBlocking.HasProp("__IChatMessageBlockingStatic")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatMessageBlocking")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IChatMessageBlockingStatic.IID)
            ChatMessageBlocking.__IChatMessageBlockingStatic := IChatMessageBlockingStatic(factoryPtr)
        }

        return ChatMessageBlocking.__IChatMessageBlockingStatic.MarkMessageAsBlockedAsync(localChatMessageId, blocked)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
