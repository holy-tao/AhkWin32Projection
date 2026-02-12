#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatConversationReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for reading batches of conversations from the [ChatMessageStore](chatmessagestore.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationreader
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatConversationReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatConversationReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatConversationReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously reads batches of conversations from the [ChatMessageStore](chatmessagestore.md).
     * @returns {IAsyncOperation<IVectorView<ChatConversation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationreader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IChatConversationReader")) {
            if ((queryResult := this.QueryInterface(IChatConversationReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationReader := IChatConversationReader(outPtr)
        }

        return this.__IChatConversationReader.ReadBatchAsync()
    }

    /**
     * Asynchronously reads batches of conversations from the [ChatMessageStore](chatmessagestore.md).
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<ChatConversation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversationreader.readbatchasync
     */
    ReadBatchWithCountAsync(count) {
        if (!this.HasProp("__IChatConversationReader")) {
            if ((queryResult := this.QueryInterface(IChatConversationReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversationReader := IChatConversationReader(outPtr)
        }

        return this.__IChatConversationReader.ReadBatchWithCountAsync(count)
    }

;@endregion Instance Methods
}
