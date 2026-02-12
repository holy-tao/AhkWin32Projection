#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageChange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a revision to a chat message.
 * @remarks
 * Obtain an instance of this class by calling [ReadBatchAsync](chatmessagechangereader_readbatchasync_888788553.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechange
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of change made to a chat message, such as created, modified, etc.
     * @remarks
     * An application can check the change type when deciding to accept message changes or to update its private message store. The following example checks for acceptable changes.
     * 
     * ```
     * switch (messageChange.ChangeType)
     * {
     *     case ChatMessageChangeType.MessageCreated:
     *     case ChatMessageChangeType.MessageDeleted:
     *     case ChatMessageChangeType.MessageModified:
     *         messageStore.ChangeTracker.GetChangeReader.AcceptChanges();
     *         break;
     *     case ChatMessageChangeType.ChangeTrackingLost:
     *         messageStore.ChangeTracker.Reset();
     *         break;
     *     default:
     *         break
     * }
     * 
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechange.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * Gets the updated message text.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechange.message
     * @type {ChatMessage} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        if (!this.HasProp("__IChatMessageChange")) {
            if ((queryResult := this.QueryInterface(IChatMessageChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChange := IChatMessageChange(outPtr)
        }

        return this.__IChatMessageChange.get_ChangeType()
    }

    /**
     * 
     * @returns {ChatMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IChatMessageChange")) {
            if ((queryResult := this.QueryInterface(IChatMessageChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChange := IChatMessageChange(outPtr)
        }

        return this.__IChatMessageChange.get_Message()
    }

;@endregion Instance Methods
}
