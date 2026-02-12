#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageChangeTracker.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods to enable and retrieve message change revisions.
 * @remarks
 * Get an instance of this class by referencing the [ChangeTracker](chatmessagestore_changetracker.md) property of the [ChatMessageStore](chatmessagestore.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangetracker
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageChangeTracker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageChangeTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageChangeTracker.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Enables change tracking for the messages in the message store.
     * @remarks
     * Change tracking for messages in the message store is enabled from the [ChangeTracker](chatmessagestore_changetracker.md) property of the [ChatMessageStore](chatmessagestore.md) object. This is accomplished as shown in the following example:
     * 
     * ```
     * void TurnOnChangeTracking(ChatMessageStore messageStore)
     * {
     *     messageStore.ChangeTracker.Enable();
     * }
     * 
     * 
     * ```
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangetracker.enable
     */
    Enable() {
        if (!this.HasProp("__IChatMessageChangeTracker")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangeTracker := IChatMessageChangeTracker(outPtr)
        }

        return this.__IChatMessageChangeTracker.Enable()
    }

    /**
     * Returns a [ChatMessageChangeReader class](chatmessagechangereader.md) object which provides a collection of message revisions from the message store.
     * @remarks
     * The following example uses the message change reader to find the message revision total:
     * 
     * ```
     * async int GetMessageRevisionCount(ChatMesssage messageStore)
     * {
     *     ChatMessageChangeTracker tracker = messageStore.ChangeTracker;
     *     IReadOnlyList<ChatMessageChange> changeList = await tracker.GetChangeReader().ReadBatchAsync();
     * 
     *     return changeList.Count;
     * }
     * 
     * ```
     * @returns {ChatMessageChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangetracker.getchangereader
     */
    GetChangeReader() {
        if (!this.HasProp("__IChatMessageChangeTracker")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangeTracker := IChatMessageChangeTracker(outPtr)
        }

        return this.__IChatMessageChangeTracker.GetChangeReader()
    }

    /**
     * Resets change tracking for the messages in the message store. The first revision begins with the next message change.
     * @remarks
     * The following example resets change tracking when the revision change type indicates [ChatMessageChangeType](chatmessagechangetype.md).ChangeTrackingLost:
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
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangetracker.reset
     */
    Reset() {
        if (!this.HasProp("__IChatMessageChangeTracker")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangeTracker := IChatMessageChangeTracker(outPtr)
        }

        return this.__IChatMessageChangeTracker.Reset()
    }

;@endregion Instance Methods
}
