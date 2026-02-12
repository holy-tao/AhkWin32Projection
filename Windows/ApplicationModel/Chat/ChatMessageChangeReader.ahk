#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageChangeReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for reading and accepting message change revisions.
 * @remarks
 * Obtain an instance of this class by calling [GetChangeReader](chatmessagechangetracker_getchangereader_1364424875.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangereader
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageChangeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageChangeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageChangeReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Accepts all the changes up to and including the latest change to the message.
     * @remarks
     * The AcceptChanges method accepts all the message changes currently tracked by the change tracker. Calling AcceptChanges will cause change tracking to reset and tracking will begin again with the next message change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangereader.acceptchanges
     */
    AcceptChanges() {
        if (!this.HasProp("__IChatMessageChangeReader")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangeReader := IChatMessageChangeReader(outPtr)
        }

        return this.__IChatMessageChangeReader.AcceptChanges()
    }

    /**
     * Accepts all the changes up to and including a specified change.
     * @remarks
     * The AcceptChangesThrough method accepts all the message changes currently tracked up to and including the change specified in *lastChangeToAcknowledge*. Calling AcceptChangesThrough will cause change tracking to reset and tracking will begin again with the next message change.
     * @param {ChatMessageChange} lastChangeToAcknowledge The last change to acknowledge.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangereader.acceptchangesthrough
     */
    AcceptChangesThrough(lastChangeToAcknowledge) {
        if (!this.HasProp("__IChatMessageChangeReader")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangeReader := IChatMessageChangeReader(outPtr)
        }

        return this.__IChatMessageChangeReader.AcceptChangesThrough(lastChangeToAcknowledge)
    }

    /**
     * Returns a batch list of chat message change objects from the message store’s change tracker.
     * @remarks
     * This method returns an IReadOnlyList of [ChatMessageChange class](chatmessagechange.md) objects. The method is invoked as an [IAsyncOperation](/previous-versions/bb776309(v=vs.85)) as shown in the following example:
     * 
     * ```
     * ChatMessageChangeTracker tracker = messageStore.ChangeTracker;
     * IReadOnlyList<ChatMessageChange> changeList = await tracker.GetChangeReader.ReadBatchAsync();
     * 
     * ```
     * @returns {IAsyncOperation<IVectorView<ChatMessageChange>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IChatMessageChangeReader")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangeReader := IChatMessageChangeReader(outPtr)
        }

        return this.__IChatMessageChangeReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
