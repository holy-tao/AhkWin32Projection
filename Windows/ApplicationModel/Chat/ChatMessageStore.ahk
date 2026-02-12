#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageStore.ahk
#Include .\IChatMessageStore2.ahk
#Include .\IChatMessageStore3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ChatMessageStore.ahk
#Include .\ChatMessageChangedEventArgs.ahk
#Include .\ChatMessageStoreChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the methods and properties to read, manage and send messages. An application gets access to the message store using the static [ChatMessageManager class](chatmessagemanager.md).
 * @remarks
 * Obtain an instance of this class by calling [RequestStoreAsync](chatmessagemanager_requeststoreasync_428591920.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageStore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [ChatMessageChangeTracker class](chatmessagechangetracker.md) object for the message store. A message change tracker allows an application to monitor changes to messages in the message store.
     * @remarks
     * An application can enable change tracking by accessing this [ChatMessageChangeTracker](chatmessagechangetracker.md) object. The following example shows how to enable message change tracking.
     * 
     * ```
     * // Enable message change tracking
     * void SetTrackingOn(ChatMessageStore store)
     * {
     *     store.ChangeTracker.Enable();
     * }
     * ```
     * 
     * The chat application receives notifications of message changes in its message change event handler which is registered to the [MessageChanged](chatmessagestore_messagechanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.changetracker
     * @type {ChatMessageChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * An event that occurs when a message in the message store is changed.
     * @remarks
     * The following simple example demonstrates how to declare and enable change tracking for message changes.
     * 
     * ```
     * void ChatMessageStore_MessageChanged(ChatMessageStore store, ChatMessageChangedEventArgs changeArgs)
     * {
     *     // Act on the event…
     * }
     * 
     * void SetStoreProperties(ChatMessageStore store)
     * {
     *     store.MessageChanged += ChatMessageStore_MessageChanged;
     *     store.ChangeTracker.Enable();
     * }
     * ```
     * @type {TypedEventHandler<ChatMessageStore, ChatMessageChangedEventArgs>}
    */
    OnMessageChanged {
        get {
            if(!this.HasProp("__OnMessageChanged")){
                this.__OnMessageChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2a4ed3d1-0d01-5133-b9e4-ddf68f099485}"),
                    ChatMessageStore,
                    ChatMessageChangedEventArgs
                )
                this.__OnMessageChangedToken := this.add_MessageChanged(this.__OnMessageChanged.iface)
            }
            return this.__OnMessageChanged
        }
    }

    /**
     * Occurs when something in the [ChatMessageStore](chatmessagestore.md) has changed.
     * @type {TypedEventHandler<ChatMessageStore, ChatMessageStoreChangedEventArgs>}
    */
    OnStoreChanged {
        get {
            if(!this.HasProp("__OnStoreChanged")){
                this.__OnStoreChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3b5903d7-a037-5c7c-8336-88423d81e408}"),
                    ChatMessageStore,
                    ChatMessageStoreChangedEventArgs
                )
                this.__OnStoreChangedToken := this.add_StoreChanged(this.__OnStoreChanged.iface)
            }
            return this.__OnStoreChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageChangedToken")) {
            this.remove_MessageChanged(this.__OnMessageChangedToken)
            this.__OnMessageChanged.iface.Dispose()
        }

        if(this.HasProp("__OnStoreChangedToken")) {
            this.remove_StoreChanged(this.__OnStoreChangedToken)
            this.__OnStoreChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ChatMessageChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.get_ChangeTracker()
    }

    /**
     * Deletes a message from the chat message store.
     * @param {HSTRING} localMessageId The local ID of the message to be deleted.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.deletemessageasync
     */
    DeleteMessageAsync(localMessageId) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.DeleteMessageAsync(localMessageId)
    }

    /**
     * Downloads a message specified by the identifier to the message store.
     * @remarks
     * The message contents including its attachments are downloaded. An application will call this method when the message status is [ChatMessageStatus](chatmessagestatus.md).ReceiveDownloadNeeded.
     * @param {HSTRING} localChatMessageId The local ID of the message to be downloaded.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.downloadmessageasync
     */
    DownloadMessageAsync(localChatMessageId) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.DownloadMessageAsync(localChatMessageId)
    }

    /**
     * Retrieves a message specified by an identifier from the message store.
     * @remarks
     * The message corresponding to the specified identifier is returned. An application can use this method to display a message or store messages in its own private cache.
     * @param {HSTRING} localChatMessageId The local ID of the chat message to be retrieved.
     * @returns {IAsyncOperation<ChatMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getmessageasync
     */
    GetMessageAsync(localChatMessageId) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.GetMessageAsync(localChatMessageId)
    }

    /**
     * Gets a [ChatMessageReader class](chatmessagereader.md) object which provides a message collection from the message store. The collection of messages is limited to the time span provided.
     * @returns {ChatMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getmessagereader
     */
    GetMessageReader1() {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.GetMessageReader1()
    }

    /**
     * Gets a [ChatMessageReader class](chatmessagereader.md) object which provides a message collection from the message store.
     * @remarks
     * The following example uses the message reader to find the first message that has a subject containing a simple search string:
     * 
     * ```
     * async ChatMessage SearchMessagesBySubject(ChatMesssage store, string searchItem)
     * {
     *     ChatMessage foundMessage = null;
     *     IReadOnlyList<ChatMessage> messageList = await store.GetMessageReader().ReadBatchAsync();
     *     if (messageList.Count > 0)
     *     {
     *         foreach(ChatMessage message in messageList)
     *         {
     *             If (message.Subject.Contains(searchItem))
     *             {
     *                 foundMessage = message;{
     *                 break;
     *             }
     *         }
     *     }
     *     return foundMessage;
     * }
     * ```
     * @param {TimeSpan} recentTimeLimit 
     * @returns {ChatMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getmessagereader
     */
    GetMessageReader2(recentTimeLimit) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.GetMessageReader2(recentTimeLimit)
    }

    /**
     * Marks a specified message in the store as already read.
     * @remarks
     * The [IsRead](chatmessage_isread.md) property of the [ChatMessage class](chatmessage.md) matching the *localMessageId* parameter is set to "true" when this method completes.
     * @param {HSTRING} localChatMessageId The local ID of the message to be marked as read.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.markmessagereadasync
     */
    MarkMessageReadAsync(localChatMessageId) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.MarkMessageReadAsync(localChatMessageId)
    }

    /**
     * Attempts a retry of sending a specified message from the message store.
     * @remarks
     * The message contents including its attachments are downloaded. An application will call this method it if it chooses to retry sending the message when the message status is [ChatMessageStatus](chatmessagestatus.md).SendFailed.
     * @param {HSTRING} localChatMessageId The local ID of the message to be retried.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.retrysendmessageasync
     */
    RetrySendMessageAsync(localChatMessageId) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.RetrySendMessageAsync(localChatMessageId)
    }

    /**
     * Attempts to send a chat message. The message is saved to the message store as part of the send operation.
     * @remarks
     * Once the send is attempted, the message is assigned an identifier and the [Id](chatmessage_id.md) property is set to this value. If the send operation fails, the application can try sending the message again later with [RetrySendMessageAsync](chatmessagestore_retrysendmessageasync_1122758369.md) method using the assigned identifier.
     * @param {ChatMessage} chatMessage_ The chat message to be sent.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.sendmessageasync
     */
    SendMessageAsync(chatMessage_) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.SendMessageAsync(chatMessage_)
    }

    /**
     * Checks if a chat message is valid and returns the validation result.
     * @remarks
     * Message validation will check the properties of the message for proper format, valid transport selected, attachment count, recipient count, and valid recipients.
     * @param {ChatMessage} chatMessage_ The chat message to validate.
     * @returns {ChatMessageValidationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.validatemessage
     */
    ValidateMessage(chatMessage_) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.ValidateMessage(chatMessage_)
    }

    /**
     * 
     * @param {TypedEventHandler<ChatMessageStore, ChatMessageChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MessageChanged(value) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.add_MessageChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_MessageChanged(value) {
        if (!this.HasProp("__IChatMessageStore")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore := IChatMessageStore(outPtr)
        }

        return this.__IChatMessageStore.remove_MessageChanged(value)
    }

    /**
     * Asynchronously forwards the specified message to new recipients.
     * @param {HSTRING} localChatMessageId The ID of the message to forward.
     * @param {IIterable<HSTRING>} addresses The addresses of the new recipients of the forwarded message.
     * @returns {IAsyncOperation<ChatMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.forwardmessageasync
     */
    ForwardMessageAsync(localChatMessageId, addresses) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.ForwardMessageAsync(localChatMessageId, addresses)
    }

    /**
     * Asynchronously gets a [ChatConversation](chatconversation.md) by ID using the specified transports.
     * @param {HSTRING} conversationId The ID of the conversation to retrieve.
     * @returns {IAsyncOperation<ChatConversation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getconversationasync
     */
    GetConversationAsync(conversationId) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetConversationAsync(conversationId)
    }

    /**
     * Asynchronously gets a [ChatConversation](chatconversation.md) by ID.
     * @param {HSTRING} conversationId The ID of the conversation to retrieve.
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {IAsyncOperation<ChatConversation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getconversationasync
     */
    GetConversationForTransportsAsync(conversationId, transportIds) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetConversationForTransportsAsync(conversationId, transportIds)
    }

    /**
     * Asynchronously gets a conversation based on a threading info object.
     * @param {ChatConversationThreadingInfo} threadingInfo The threading info that identifies the conversation.
     * @returns {IAsyncOperation<ChatConversation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getconversationfromthreadinginfoasync
     */
    GetConversationFromThreadingInfoAsync(threadingInfo) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetConversationFromThreadingInfoAsync(threadingInfo)
    }

    /**
     * Gets a new or existing [ChatConversationReader](chatconversationreader.md) for the message store using the specified transports.
     * @returns {ChatConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getconversationreader
     */
    GetConversationReader() {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetConversationReader()
    }

    /**
     * Gets a new or existing [ChatConversationReader](chatconversationreader.md) for the message store.
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {ChatConversationReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getconversationreader
     */
    GetConversationForTransportsReader(transportIds) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetConversationForTransportsReader(transportIds)
    }

    /**
     * Gets a message by its remote ID.
     * @param {HSTRING} transportId The [TransportId](chatmessage_transportid.md) to use to get the [ChatMessage](chatmessage.md).
     * @param {HSTRING} remoteId The [RemoteId](chatmessage_remoteid.md) of the [ChatMessage](chatmessage.md) to retrieve.
     * @returns {IAsyncOperation<ChatMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getmessagebyremoteidasync
     */
    GetMessageByRemoteIdAsync(transportId, remoteId) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetMessageByRemoteIdAsync(transportId, remoteId)
    }

    /**
     * Asynchronously gets the number of unread chat messages using the specified transports.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getunseencountasync
     */
    GetUnseenCountAsync() {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetUnseenCountAsync()
    }

    /**
     * Asynchronously gets the number of unread chat messages.
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getunseencountasync
     */
    GetUnseenCountForTransportsReaderAsync(transportIds) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetUnseenCountForTransportsReaderAsync(transportIds)
    }

    /**
     * Asynchronously marks all transport messages as seen.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.markasseenasync
     */
    MarkAsSeenAsync() {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.MarkAsSeenAsync()
    }

    /**
     * Asynchronously marks all transport messages as seen.
     * @param {IIterable<HSTRING>} transportIds 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.markasseenasync
     */
    MarkAsSeenForTransportsAsync(transportIds) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.MarkAsSeenForTransportsAsync(transportIds)
    }

    /**
     * Gets a new or existing [ChatSearchReader](chatsearchreader.md) to be used to search for messages.
     * @param {ChatQueryOptions} value The query options that the search reader will use when looking for matching messages.
     * @returns {ChatSearchReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getsearchreader
     */
    GetSearchReader(value) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.GetSearchReader(value)
    }

    /**
     * Asynchronously saves a message to the [ChatMessageStore](chatmessagestore.md).
     * @param {ChatMessage} chatMessage_ The message to save.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.savemessageasync
     */
    SaveMessageAsync(chatMessage_) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.SaveMessageAsync(chatMessage_)
    }

    /**
     * Asynchronously attempts to cancel downloading the specified message.
     * @param {HSTRING} localChatMessageId The ID of the message to stop downloading.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.trycanceldownloadmessageasync
     */
    TryCancelDownloadMessageAsync(localChatMessageId) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.TryCancelDownloadMessageAsync(localChatMessageId)
    }

    /**
     * Asynchronously attempts to cancel sending the specified message.
     * @param {HSTRING} localChatMessageId The ID of the message to stop sending.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.trycancelsendmessageasync
     */
    TryCancelSendMessageAsync(localChatMessageId) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.TryCancelSendMessageAsync(localChatMessageId)
    }

    /**
     * 
     * @param {TypedEventHandler<ChatMessageStore, ChatMessageStoreChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StoreChanged(handler) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.add_StoreChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StoreChanged(token) {
        if (!this.HasProp("__IChatMessageStore2")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore2 := IChatMessageStore2(outPtr)
        }

        return this.__IChatMessageStore2.remove_StoreChanged(token)
    }

    /**
     * Gets a message by the sync ID.
     * @param {HSTRING} syncId The sync ID of the message.
     * @returns {IAsyncOperation<ChatMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagestore.getmessagebysyncidasync
     */
    GetMessageBySyncIdAsync(syncId) {
        if (!this.HasProp("__IChatMessageStore3")) {
            if ((queryResult := this.QueryInterface(IChatMessageStore3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageStore3 := IChatMessageStore3(outPtr)
        }

        return this.__IChatMessageStore3.GetMessageBySyncIdAsync(syncId)
    }

;@endregion Instance Methods
}
