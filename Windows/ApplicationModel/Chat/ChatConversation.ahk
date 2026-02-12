#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatConversation.ahk
#Include .\IChatConversation2.ahk
#Include .\IChatItem.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ChatConversation.ahk
#Include .\RemoteParticipantComposingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a conversation in a chat client.
 * @remarks
 * Call the [ChatMessageStore.GetConversationAsync](/uwp/api/windows.applicationmodel.chat.chatmessagestore.getconversationasync) or [ChatMessageStore.GetConversationFromThreadingInfoAsync](chatmessagestore_getconversationfromthreadinginfoasync_896256404.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatConversation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatConversation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatConversation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating if there are unread messages in the [ChatConversation](chatconversation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.hasunreadmessages
     * @type {Boolean} 
     */
    HasUnreadMessages {
        get => this.get_HasUnreadMessages()
    }

    /**
     * Gets the unique identifier for the [ChatConversation](chatconversation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the subject of a group conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the [ChatConversation](chatconversation.md) is muted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.isconversationmuted
     * @type {Boolean} 
     */
    IsConversationMuted {
        get => this.get_IsConversationMuted()
        set => this.put_IsConversationMuted(value)
    }

    /**
     * Gets the ID of the most recent message in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.mostrecentmessageid
     * @type {HSTRING} 
     */
    MostRecentMessageId {
        get => this.get_MostRecentMessageId()
    }

    /**
     * Gets a list of all the participants in the conversation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.participants
     * @type {IVector<HSTRING>} 
     */
    Participants {
        get => this.get_Participants()
    }

    /**
     * Gets the threading info for the [ChatConversation](chatconversation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.threadinginfo
     * @type {ChatConversationThreadingInfo} 
     */
    ThreadingInfo {
        get => this.get_ThreadingInfo()
    }

    /**
     * Gets or sets a boolean that indicates whether participants can be modified or not.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.canmodifyparticipants
     * @type {Boolean} 
     */
    CanModifyParticipants {
        get => this.get_CanModifyParticipants()
        set => this.put_CanModifyParticipants(value)
    }

    /**
     * Gets the item kind.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.itemkind
     * @type {Integer} 
     */
    ItemKind {
        get => this.get_ItemKind()
    }

    /**
     * Occurs when the remote user has started or finished typing.
     * @type {TypedEventHandler<ChatConversation, RemoteParticipantComposingChangedEventArgs>}
    */
    OnRemoteParticipantComposingChanged {
        get {
            if(!this.HasProp("__OnRemoteParticipantComposingChanged")){
                this.__OnRemoteParticipantComposingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{09e43bb2-692d-5330-b9e7-adf69ad5c1a9}"),
                    ChatConversation,
                    RemoteParticipantComposingChangedEventArgs
                )
                this.__OnRemoteParticipantComposingChangedToken := this.add_RemoteParticipantComposingChanged(this.__OnRemoteParticipantComposingChanged.iface)
            }
            return this.__OnRemoteParticipantComposingChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRemoteParticipantComposingChangedToken")) {
            this.remove_RemoteParticipantComposingChanged(this.__OnRemoteParticipantComposingChangedToken)
            this.__OnRemoteParticipantComposingChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUnreadMessages() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_HasUnreadMessages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_Subject()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.put_Subject(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConversationMuted() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_IsConversationMuted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsConversationMuted(value) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.put_IsConversationMuted(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MostRecentMessageId() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_MostRecentMessageId()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Participants() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_Participants()
    }

    /**
     * 
     * @returns {ChatConversationThreadingInfo} 
     */
    get_ThreadingInfo() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.get_ThreadingInfo()
    }

    /**
     * Asynchronously deletes all of the messages in the [ChatConversation](chatconversation.md) and the conversation itself.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.DeleteAsync()
    }

    /**
     * Gets the [ChatMessageReader](chatmessagereader.md) for this [ChatConversation](chatconversation.md).
     * @returns {ChatMessageReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.getmessagereader
     */
    GetMessageReader() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.GetMessageReader()
    }

    /**
     * Asynchronously marks all the messages in the conversation before the specified [DateTime](../windows.foundation/datetime.md) as read.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.markmessagesasreadasync
     */
    MarkAllMessagesAsReadAsync() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.MarkAllMessagesAsReadAsync()
    }

    /**
     * Asynchronously marks all the messages in the conversation as read.
     * @param {DateTime} value 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.markmessagesasreadasync
     */
    MarkMessagesAsReadAsync(value) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.MarkMessagesAsReadAsync1(value)
    }

    /**
     * Asynchronously saves the [ChatConversation](chatconversation.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.SaveAsync()
    }

    /**
     * Call this to indicate that the local participant has started or has completed typing.
     * @param {HSTRING} transportId Specifies the [ChatMessageTransport](chatmessagetransport.md) to use.
     * @param {HSTRING} participantAddress The address of the remote participant.
     * @param {Boolean} isComposing TRUE if the local participant is typing, otherwise FALSE.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.notifylocalparticipantcomposing
     */
    NotifyLocalParticipantComposing(transportId, participantAddress, isComposing) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.NotifyLocalParticipantComposing(transportId, participantAddress, isComposing)
    }

    /**
     * Locally triggers the event that indicates that a remote participant is typing.
     * @param {HSTRING} transportId Specifies the [ChatMessageTransport](chatmessagetransport.md) to use.
     * @param {HSTRING} participantAddress The address of the remote participant.
     * @param {Boolean} isComposing TRUE if the remote participant is typing, otherwise FALSE.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatconversation.notifyremoteparticipantcomposing
     */
    NotifyRemoteParticipantComposing(transportId, participantAddress, isComposing) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.NotifyRemoteParticipantComposing(transportId, participantAddress, isComposing)
    }

    /**
     * 
     * @param {TypedEventHandler<ChatConversation, RemoteParticipantComposingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemoteParticipantComposingChanged(handler) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.add_RemoteParticipantComposingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RemoteParticipantComposingChanged(token) {
        if (!this.HasProp("__IChatConversation")) {
            if ((queryResult := this.QueryInterface(IChatConversation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation := IChatConversation(outPtr)
        }

        return this.__IChatConversation.remove_RemoteParticipantComposingChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyParticipants() {
        if (!this.HasProp("__IChatConversation2")) {
            if ((queryResult := this.QueryInterface(IChatConversation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation2 := IChatConversation2(outPtr)
        }

        return this.__IChatConversation2.get_CanModifyParticipants()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanModifyParticipants(value) {
        if (!this.HasProp("__IChatConversation2")) {
            if ((queryResult := this.QueryInterface(IChatConversation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatConversation2 := IChatConversation2(outPtr)
        }

        return this.__IChatConversation2.put_CanModifyParticipants(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemKind() {
        if (!this.HasProp("__IChatItem")) {
            if ((queryResult := this.QueryInterface(IChatItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatItem := IChatItem(outPtr)
        }

        return this.__IChatItem.get_ItemKind()
    }

;@endregion Instance Methods
}
